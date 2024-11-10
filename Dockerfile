ARG CADDY_VERSION=2
FROM caddy:${CADDY_VERSION}-builder AS builder

# Using the prefer-wildcard branch directly until v2.9.0-beta.3 gets released.
# Also including the caddy-l4 plugin so you have the ability to TLS-proxy things
# other than HTTP if you want
RUN XCADDY_DEBUG=1 xcaddy build v2.9.0-beta.3 \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/googleclouddns \
    --with github.com/mholt/caddy-l4

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]

