# docker-curator
[![Github Action Status](https://github.com/koshatul/docker-curator/workflows/CI/badge.svg)](https://github.com/koshatul/docker-curator/actions?query=workflow%3ACI)

Automated Docker builds of elasticsearch [curator](https://github.com/elastic/curator/)

Docker builds are done with [GitHub Actions](https://github.com/koshatul/docker-curator/actions) and pushed to [Docker Hub](https://hub.docker.com/r/koshatul/curator).

### Usage

```shell
docker run -ti --rm koshatul/curator:v5.8.1 --help
```

Replace `v5.8.1` with the latest release from the [elastic/curator releases](https://github.com/elastic/curator/releases) page.

For more instructions check out the repo this is built from [elastic/curator](https://github.com/elastic/curator/).
