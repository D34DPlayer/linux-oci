## 1. BUILD ARGS
# These allow changing the produced image by passing different build args to adjust
# the source from which your image is built.
# Build args can be provided on the commandline when building locally with:
#   podman build -f Containerfile --build-arg FEDORA_VERSION=40 -t local-image

# SOURCE_IMAGE arg can be anything from ublue upstream which matches your desired version:
# See list here: https://github.com/orgs/ublue-os/packages?repo_name=main
# - "silverblue"
# - "kinoite"
# - "sericea"
# - "onyx"
# - "lazurite"
# - "vauxite"
# - "base"
#
#  "aurora", "bazzite", "bluefin" or "ucore" may also be used but have different suffixes.
ARG SOURCE_IMAGE="base"

## SOURCE_SUFFIX arg should include a hyphen and the appropriate suffix name
# These examples all work for silverblue/kinoite/sericea/onyx/lazurite/vauxite/base
# - "-main"
# - "-nvidia"
# - "-asus"
# - "-asus-nvidia"
# - "-surface"
# - "-surface-nvidia"
#
# aurora, bazzite and bluefin each have unique suffixes. Please check the specific image.
# ucore has the following possible suffixes
# - stable
# - stable-nvidia
# - stable-zfs
# - stable-nvidia-zfs
# - (and the above with testing rather than stable)
ARG SOURCE_SUFFIX="-nvidia"

## SOURCE_TAG arg must be a version built for the specific image: eg, 39, 40, gts, latest
ARG SOURCE_TAG="40"

FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}


COPY ./build/vars.sh /tmp/build/
RUN mkdir -p /var/lib/alternatives && \
    ostree container commit

COPY ./build/00-Base /tmp/build/Base
RUN /tmp/build/Base/build.sh && \
    ostree container commit

COPY ./build/01-System /tmp/build/System
RUN /tmp/build/System/build.sh && \
    ostree container commit

COPY ./build/02-DE /tmp/build/DE
RUN /tmp/build/DE/build.sh && \
    ostree container commit

COPY ./build/03-Terminal /tmp/build/Terminal
RUN /tmp/build/Terminal/build.sh && \
    ostree container commit
