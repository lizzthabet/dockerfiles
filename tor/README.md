# tor

A simple Tor image based on Debian that includes the `tor` daemon. No fancy entrypoint scripts or extra magic.

## using the image

this is a placeholder for notes on:
- using the image to run an onion site
- where files should be mounted to
- the permissions script helper

## building the image

build the image on the host platform:

```bash
docker build -t local/tor:dev --no-cache --progress=plain .
```

## testing the image

```bash
docker run nginx:latest
docker run --rm -v ./test/torrc:/etc/tor/torrc -v ./test/hidden_service:/var/lib/tor/secretsite/hidden_service local/tor:dev -f /etc/tor/test.torrc
```

or with compose:
```bash
docker compose up
```