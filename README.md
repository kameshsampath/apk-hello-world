# Hello World

A demo to show how to apk of an [application](https://github.com/kameshsampath/go-hello-world)

## Pre-requisites

- [Drone CLI](https://docs.drone.io/cli/install/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Push to any Docker v2 registry

Create a file `secrets` with following values,

```shell
image_repo: <your Docker v2 repo>
image_registry_username: <your registry username>
image_registry_password: <your  registry user password>
```

Build package and image,

```shell
drone exec --trusted --secret-file secrets
```

Build only image

```shell
drone exec --trusted --secret-file secrets --include="publish"
```

## Run App

```shell
docker run --rm -p 8080:8080 $IMAGE_REPO
```

Do a curl command like,

```shell
curl "localhost:8080?name=$USER"
```

Should have a response,

```json
{"Prefix":"Hello","Name":"$USER","Message":"Hello,$USER"}
```

## Generate Signing Keys

If you want to generate the `melange` keys,

```shell
drone exec --include 'keygen' --pipeline="keys"
```

## References

- <https://github.com/kameshsampath/apko>
- <https://github.com/chainguard-dev/melange>
