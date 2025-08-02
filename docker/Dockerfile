FROM golang:1.21-alpine

ARG HUGO_VERSION=v0.121.1

# Install necessary deps for Hugo extended (SCSS support)
RUN apk add --no-cache git build-base npm

# Build Hugo with extended support
RUN go install --tags extended github.com/gohugoio/hugo@${HUGO_VERSION}
RUN apk add --no-cache python3 py-pip openssh-client
RUN pip install --break-system-packages ghp-import
