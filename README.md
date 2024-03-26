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

- *Automate the generation of a Docker Compose file for Magento version and for each new technology release*
- *Add healthcheck for each service directly in its Docker image*
- *Include host configuration required by [OpenSearch](https://experienceleague.adobe.com/es/docs/commerce-operations/performance-best-practices/software) and [Magento](https://experienceleague.adobe.com/es/docs/commerce-operations/performance-best-practices/software)*
- *Add scripts to init development and production environment*
- *Add [Magento recommended performance settings](https://experienceleague.adobe.com/es/docs/commerce-operations/performance-best-practices/software)*
- *Add source code and cron in PHP-FPM container*
- *Mention how the PHP CLI container has an script to install a Magento platform*
- *Explain how to use Dev Containers and Xdebug in development environment*
- *Add in Dev Container configuration all recommended VSCode Magento extensions*
- *Check if it is necessary to mount volumes for OpenSearch and Redis*
- *Check mounted volume options and remember to use `:cached` when it is possible*
- *Remember to use traefik.enable=false label for the required containers*
- *In production, remember to add `600` permissions for `acme.json` file that saves certificate information, to avoid error `traefik-1  | time="2024-03-26T03:03:26Z" level=error msg="The ACME resolver \"le-http\" is skipped from the resolvers list because: unable to get ACME account: permissions 644 for /etc/traefik/acme.json are too open, please use 600"`*
- *Remove unneeded Nginx certificates created in Magento Cloud image*
- *Remember to mention: `"OPENSEARCH_JAVA_OPTS=-Xms1g -Xmx1g" # Set min and max JVM heap sizes to at least 50% of system RAM`*
- *Create image Elasticsearch*
- *Check if it is possible to add Traefik labels inside tech stack images (i.e.: user route host condition with platform URL environment variable)*
- *Remove OpenSearch security plugin by environment variable*
- *Check if it is necessary to mount volume inside Nginx container*

## Changelog

Detailed changes for each release are documented in [`CHANGELOG.md`](./CHANGELOG.md).

## License

This work is published under [MIT License](./LICENSE).

## Author

Always happy to receive a greeting on:

- [LinkedIn](https://www.linkedin.com/in/cristian-marcelo-de-picciotto/) 
- [Web](https://d3p1.dev/)
