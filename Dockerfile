# syntax=docker/dockerfile:1

ARG GO_VERSION=1.21
ARG HTMLTEST_VERSION=0.17.0

FROM golang:${GO_VERSION}-alpine as base
WORKDIR /src
RUN apk --update add nodejs npm git

FROM base as node
COPY package*.json .
RUN npm install && npm cache clean --force

FROM base as hugo
ARG HUGO_VERSION=0.116.1
ARG TARGETARCH
WORKDIR /bin
RUN go install github.com/gohugoio/hugo@v${HUGO_VERSION}

FROM base as build-base
COPY --from=hugo $GOPATH/bin/hugo /bin/hugo
COPY --from=node /src/node_modules /src/node_modules
COPY . .

FROM build-base as dev

FROM build-base as build
ARG HUGO_ENV
ARG DOCS_URL
RUN hugo --gc --minify -d /out -e $HUGO_ENV -b $DOCS_URL

FROM scratch as release
COPY --from=build /out /

FROM davidanson/markdownlint-cli2:v0.10.0 as lint
USER root
RUN --mount=type=bind,target=. \
    /usr/local/bin/markdownlint-cli2 \
    "content/**/*.md" \
    "#content/engine/release-notes/*.md" \
    "#content/desktop/previous-versions/*.md"

FROM wjdp/htmltest:v${HTMLTEST_VERSION} as test
WORKDIR /test
COPY --from=build /out ./public
ADD .htmltest.yml .htmltest.yml
RUN htmltest

FROM build-base as update-modules
ARG MODULE="-u"
RUN hugo mod get ${MODULE}
RUN hugo mod vendor

FROM scratch as vendor
COPY --from=update-modules /src/_vendor /_vendor
COPY --from=update-modules /src/go.* /

FROM build-base as build-upstream
ARG UPSTREAM_MODULE_NAME
ARG UPSTREAM_REPO
ARG UPSTREAM_COMMIT
ENV HUGO_MODULE_REPLACEMENTS="github.com/${UPSTREAM_MODULE_NAME} -> github.com/${UPSTREAM_REPO} ${UPSTREAM_COMMIT}"
RUN hugo --ignoreVendorPaths "github.com/${UPSTREAM_MODULE_NAME}" -d /out

FROM wjdp/htmltest:v${HTMLTEST_VERSION} as validate-upstream
WORKDIR /test
COPY --from=build-upstream /out ./public
ADD .htmltest.yml .htmltest.yml
RUN htmltest

FROM dev
