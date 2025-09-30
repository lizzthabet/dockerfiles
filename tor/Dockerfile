# syntax=docker/dockerfile:1

FROM debian:13-slim@sha256:c2880112cc5c61e1200c26f106e4123627b49726375eb5846313da9cca117337

# Based on dependencies outlined in: https://support.torproject.org/apt/
RUN apt-get update && \
  apt-get install -y --no-install-recommends apt-transport-https \
  ca-certificates \
  gpg \
  wget

COPY tor.list /etc/apt/sources.list.d/tor.list

RUN wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/deb.torproject.org-keyring.gpg >/dev/null

# The tor package is usually versioned like "0.4.8.16-2~d12.bookworm",
# so fuzzy match on the version number
# https://gitlab.torproject.org/tpo/core/tor/-/tags
ENV TOR_VERSION=0.4.8.18*

RUN apt-get update && \
  apt-get install -y --no-install-recommends tor=${TOR_VERSION} \
  deb.torproject.org-keyring && \
  rm -rf /var/lib/apt/lists/*

# The tor process needs write access to its user directory
RUN groupadd -r nonroot && \
  useradd --no-log-init -m -r -g nonroot nonroot

USER nonroot

ENTRYPOINT [ "tor" ]
