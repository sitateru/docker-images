# docker-images
Various images for development and testing

## Usage
`$ docker pull ghcr.io/sitateru/<image-name>:<tag-name>`

## Directory structure
`<image-name>`/`<tag-name>`/Dockerfile

## Images

### cimg-base-volta
[GitHub Packages](https://github.com/orgs/sitateru/packages/container/package/cimg-base-volta)
- Based on [cimg/base](https://hub.docker.com/r/cimg/base)
- Installed [Volta](https://volta.sh/)

### cimg-ruby-volta
[GitHub Packages](https://github.com/orgs/sitateru/packages/container/package/cimg-ruby-volta)
- Based on [cimg/ruby](https://hub.docker.com/r/cimg/ruby)
- Installed [Volta](https://volta.sh/)

### elasticsearch-icu-kuromoji
[GitHub Packages](https://github.com/orgs/sitateru/packages/container/package/elasticsearch-icu-kuromoji)
- Based on [docker.elastic.co/elasticsearch/elasticsearch](https://www.docker.elastic.co/r/elasticsearch)
- Added icu & kuromoji plugin

### mysql-utf8mb4
[GitHub Packages](https://github.com/orgs/sitateru/packages/container/package/mysql-utfmb4)
- Based on [mysql](https://hub.docker.com/_/mysql/)
- collation-server = `utf8mb4_bin` or `utf8mb4_0900_ai_ci`
- default_authentication_plugin = `mysql_native_password`

### opensearch-icu-kuromoji
[GitHub Packages](https://github.com/orgs/sitateru/packages/container/package/opensearch-icu-kuromoji)
- Based on [opensearchproject/opensearch](https://hub.docker.com/r/opensearchproject/opensearch)
- Added icu & kuromoji plugin

## Contributing

### Report a bug/problem
Fell free to create an isuue!

### Request a new tag
Fell free to create an isuue or PR!
