<div align=center>

# [DOCKER FT. MAGENTO]

[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)
[![Release](https://github.com/d3p1/docker-magento/actions/workflows/release.yml/badge.svg)](https://github.com/d3p1/docker-magento/actions/workflows/release.yml)

</div>

## Introduction

## Usage

### Production use

*Remember to mention how to secure docker socket.*

### Development use

*Remember to mention how to configure `/etc/hosts` or `dnsmasq`, and how to create local certificates with `mkcert`*

## Brief technical overview

## TODOs

- Implement:
-- *Script to deploy development and production environments:*
--- *Remember to include OpenSearch & Elasticsearch recommended host configuration*
--- *Remember to update OpenSearch & Elasticsearch JVM heap sizes to be at least 50% of system RAM or limit container RAM*
--- *Remember to create Traefik `acme.json` file with `600` permissions to avoid error: `traefik-1  | time="2024-03-26T03:03:26Z" level=error msg="The ACME resolver \"le-http\" is skipped from the resolvers list because: unable to get ACME account: permissions 644 for /etc/traefik/acme.json are too open, please use 600"`*

- Describe:
-- *How to use `BASE_` host environment variables to update container environment variables*
-- *How PHP CLI init Magento platform script works*
-- *How to use Dev Containers and Xdebug in development environment*

## Changelog

Detailed changes for each release are documented in [`CHANGELOG.md`](./CHANGELOG.md).

## License

This work is published under [MIT License](./LICENSE).

## Author

Always happy to receive a greeting on:

- [LinkedIn](https://www.linkedin.com/in/cristian-marcelo-de-picciotto/) 
- [Web](https://d3p1.dev/)
