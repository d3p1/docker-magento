# [1.18.0](https://github.com/d3p1/docker-magento/compare/v1.17.0...v1.18.0) (2024-06-03)


### Bug Fixes

* adjust docker configuration for development environment [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([a1a39a7](https://github.com/d3p1/docker-magento/commit/a1a39a735b9da1c1811ddea345ee3f205a5709bf))
* adjust source code mount to dev containers [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([654f6a2](https://github.com/d3p1/docker-magento/commit/654f6a2a0ea7103d5101cebd35403da3b5dea3e6))
* adjust startup script execution [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c4bde38](https://github.com/d3p1/docker-magento/commit/c4bde3810c1bd64b7faab258f5e03b6621826eec))
* improve cli execution service [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([508c3c0](https://github.com/d3p1/docker-magento/commit/508c3c06899888e28b7636ae1d62c7d433b92491))
* replace only variables genareted by the script in infra files [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([64e6d5c](https://github.com/d3p1/docker-magento/commit/64e6d5c282e24670e37b5159c3300e035e8ecc95))


### Features

* add configure services script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([fc03c82](https://github.com/d3p1/docker-magento/commit/fc03c821e76e65ce97b8efded603d88a4730eea4))

# [1.17.0](https://github.com/d3p1/docker-magento/compare/v1.16.4...v1.17.0) (2024-06-01)


### Bug Fixes

* adjust configure host script execution & adjust docker config [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c1327fa](https://github.com/d3p1/docker-magento/commit/c1327fa9122719c8997c670c881c5bae88b1ec4b))


### Features

* add docker CLI installation without interaction [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([549a880](https://github.com/d3p1/docker-magento/commit/549a880cc8803ac112038163141681735a7360b2))

## [1.16.4](https://github.com/d3p1/docker-magento/compare/v1.16.3...v1.16.4) (2024-06-01)


### Bug Fixes

* adjust envsubst logic [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([7919fb9](https://github.com/d3p1/docker-magento/commit/7919fb922af0c0d190213b0038796b7dd0eac340))

## [1.16.3](https://github.com/d3p1/docker-magento/compare/v1.16.2...v1.16.3) (2024-06-01)


### Bug Fixes

* adjust envsubst logic for infra file generation [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([86f6a63](https://github.com/d3p1/docker-magento/commit/86f6a639f7ddb5ceca85f0899c143b6af4021b4a))
* adjust script paths so it is used the dockergento folder [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([66069ee](https://github.com/d3p1/docker-magento/commit/66069ee073b336627572df4c421940a9160502b9))

## [1.16.2](https://github.com/d3p1/docker-magento/compare/v1.16.1...v1.16.2) (2024-05-28)


### Bug Fixes

* adjust add Traefik gitignore into generated infra files [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([a4cd8ad](https://github.com/d3p1/docker-magento/commit/a4cd8ad41a3af0bf36209b4d27382972c3479cdc))
* adjust envsubst logic to correctly generate infra files [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([eeb6a4f](https://github.com/d3p1/docker-magento/commit/eeb6a4f6c8293220e01776d9f3eeb617a8e67bd3))
* adjust find command for infra files generation [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([111c01e](https://github.com/d3p1/docker-magento/commit/111c01e7ddbdb57c87ed15300434a34383d4c7dc))
* adjust startup script execution [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e6cad4b](https://github.com/d3p1/docker-magento/commit/e6cad4bdcb83d1f797c7388a3ce51e3433b163d4))

## [1.16.1](https://github.com/d3p1/docker-magento/compare/v1.16.0...v1.16.1) (2024-05-27)


### Bug Fixes

* adjust text that asks for source code path definition [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([828f8c1](https://github.com/d3p1/docker-magento/commit/828f8c19a41fff176d6f9a0051186d5c6ded586b))

# [1.16.0](https://github.com/d3p1/docker-magento/compare/v1.15.0...v1.16.0) (2024-05-27)


### Features

* add the possibility to define source code path for dev environment [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([dbc5fe8](https://github.com/d3p1/docker-magento/commit/dbc5fe88cee90e12b8c1a9cc37d04e5703757c8c))
* init startup script for launched environment [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([79b77ca](https://github.com/d3p1/docker-magento/commit/79b77ca5c13973380b237d32448c5d25827d6ece))

# [1.15.0](https://github.com/d3p1/docker-magento/compare/v1.14.10...v1.15.0) (2024-05-26)


### Features

* add utility to envsubst a file [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([6803130](https://github.com/d3p1/docker-magento/commit/6803130c2ea0a28a914b90b26838323cdc99542d))
* generate infra files after launch [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([3cc15c3](https://github.com/d3p1/docker-magento/commit/3cc15c3c3b674805e5dc7dcae84d6155964c0c25))

## [1.14.10](https://github.com/d3p1/docker-magento/compare/v1.14.9...v1.14.10) (2024-05-20)


### Bug Fixes

* adjust DB initialization on general launch script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([702e598](https://github.com/d3p1/docker-magento/commit/702e5980d68459e5d09b87871219bcc704e1ea1c))

## [1.14.9](https://github.com/d3p1/docker-magento/compare/v1.14.8...v1.14.9) (2024-05-19)


### Bug Fixes

* adjust cron service volumes [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([2a9d037](https://github.com/d3p1/docker-magento/commit/2a9d037b70aff80b2bd37bb740ba612b4f929cc8))
* adjust RAM memory on search engine configuration for production launch [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([6a21382](https://github.com/d3p1/docker-magento/commit/6a21382d0390427906c2109ff0580f614685629f))
* adjust Xdebug environment variable that enables/disables Xdebug host in web service [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([9693e5c](https://github.com/d3p1/docker-magento/commit/9693e5cbb5506456512f4798453940029071875a))
* start cron service on launch after platform is up and running [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([bf86377](https://github.com/d3p1/docker-magento/commit/bf86377f49efd26b5fd00eafedbd4659354491dd))

## [1.14.8](https://github.com/d3p1/docker-magento/compare/v1.14.7...v1.14.8) (2024-05-19)


### Bug Fixes

* adjust cron service command [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([248e76f](https://github.com/d3p1/docker-magento/commit/248e76f47b551c91a3c517822791d9bd8fef1ee3))
* disable Xdebug host in web service on production launch [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e5ed8da](https://github.com/d3p1/docker-magento/commit/e5ed8da99d842ef10c382c180a25f1a64334b334))
* get RAM memory on search engine configuration for production launch [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c8640d2](https://github.com/d3p1/docker-magento/commit/c8640d2ba0fb515422a18762426a881fdbd720cd))

## [1.14.7](https://github.com/d3p1/docker-magento/compare/v1.14.6...v1.14.7) (2024-05-19)


### Bug Fixes

* remove ulimits from Docker Compose configuration (causes problems in rootless mode) [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([3484fa3](https://github.com/d3p1/docker-magento/commit/3484fa32a2771379b2ad1a2d6efb1a2874f7a0d8))

## [1.14.6](https://github.com/d3p1/docker-magento/compare/v1.14.5...v1.14.6) (2024-05-19)


### Bug Fixes

* adjust TRAEFIK_ACME_FILE_PATH environment var for production launch [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([74f8763](https://github.com/d3p1/docker-magento/commit/74f876338952119942f55f07e11b113eb5a823b8))

## [1.14.5](https://github.com/d3p1/docker-magento/compare/v1.14.4...v1.14.5) (2024-05-19)


### Bug Fixes

* adjust BASE_DOCKER_PATH environment var for production launch [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([cd3fae4](https://github.com/d3p1/docker-magento/commit/cd3fae417a11cb7b64229eb548cd1e3defd4ffe5))

## [1.14.4](https://github.com/d3p1/docker-magento/compare/v1.14.3...v1.14.4) (2024-05-19)


### Bug Fixes

* adjust BASE_DOCKER_PATH and TRAEFIK_ACME_FILE_PATH environment vars for production launch [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([26ea556](https://github.com/d3p1/docker-magento/commit/26ea556c7feceec13119b73d3ba8c1993c80d687))

## [1.14.3](https://github.com/d3p1/docker-magento/compare/v1.14.2...v1.14.3) (2024-05-19)


### Bug Fixes

* adjust add vm.max_map_count setting for search engine [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([77be034](https://github.com/d3p1/docker-magento/commit/77be034dde5240de3653d96665ac226cb40be3f1))

## [1.14.2](https://github.com/d3p1/docker-magento/compare/v1.14.1...v1.14.2) (2024-05-19)


### Bug Fixes

* adjust Docker rootless mode configuration on production deployment [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([4290065](https://github.com/d3p1/docker-magento/commit/429006599e8be8c94605b298ff842c4f2b8ba9fc))
* adjust environment files for Docker Compose services [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([f7badcc](https://github.com/d3p1/docker-magento/commit/f7badcc0795e46796b87d1ad2354971b23e73ac9))
* adjust search engine configuration on production deployment [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([ad32a17](https://github.com/d3p1/docker-magento/commit/ad32a17b60b03ffd1d63942483e0f55b0f64f91c))
* enable cron service on production launch [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([49646e3](https://github.com/d3p1/docker-magento/commit/49646e310ad8bfa422f79a51e507ec47b334f2c5))

## [1.14.1](https://github.com/d3p1/docker-magento/compare/v1.14.0...v1.14.1) (2024-05-19)


### Bug Fixes

* adjust COMPOSE environment variable definition [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([5a924ca](https://github.com/d3p1/docker-magento/commit/5a924caa470d2b3f46848641752d14b253d52b46))
* adjust script execution instruction [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([a96d8c2](https://github.com/d3p1/docker-magento/commit/a96d8c26ef8dee1bcf2cf20f01ee7f7ad0b3eeab))

# [1.14.0](https://github.com/d3p1/docker-magento/compare/v1.13.0...v1.14.0) (2024-05-18)


### Features

* add MariaDB (v10.4) image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e9f788c](https://github.com/d3p1/docker-magento/commit/e9f788c2b26f1d877e2daffefd95fbe9870adb8f))
* add PHP version selection menu to general launch script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([658fa23](https://github.com/d3p1/docker-magento/commit/658fa2302757ee1acc4b31ab155b69bb27c320c6))
* improve search engine configuration in install script of PHP CLI images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([b10d081](https://github.com/d3p1/docker-magento/commit/b10d081db8d969289e1347c1d0e0f45afd730363))

# [1.13.0](https://github.com/d3p1/docker-magento/compare/v1.12.2...v1.13.0) (2024-05-18)


### Bug Fixes

* adjust Composer install command for Magento production mode in PHP CLI images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([0dd905c](https://github.com/d3p1/docker-magento/commit/0dd905cb99c990166e75c0491587c7a12ce17267))


### Features

* add Magento cache watcher to PHP-FPM (with development purpose) images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([b86a33c](https://github.com/d3p1/docker-magento/commit/b86a33ce281cbe154c769b76f5f2a6f567f66fd1))
* mount Composer folder into PHP service container to be able to use Composer cache [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([88d82ff](https://github.com/d3p1/docker-magento/commit/88d82ff9df3d6157ea318f51e54b0845fefe8315))

## [1.12.2](https://github.com/d3p1/docker-magento/compare/v1.12.1...v1.12.2) (2024-05-18)


### Bug Fixes

* adjust Magento developer mode definition [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e4124dc](https://github.com/d3p1/docker-magento/commit/e4124dcb54d97808040cbd3b5c54a7a82a5312d9))

## [1.12.1](https://github.com/d3p1/docker-magento/compare/v1.12.0...v1.12.1) (2024-05-18)


### Bug Fixes

* adjust docker installation [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([2503ae7](https://github.com/d3p1/docker-magento/commit/2503ae7fd2ff1409e3d84f0be35a477f9c77a9c4))
* adjust import db dump [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([383e61a](https://github.com/d3p1/docker-magento/commit/383e61afa11bd8ddad10c9f15d533ac74d70eca5))
* adjust Magento version definition [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([73e3415](https://github.com/d3p1/docker-magento/commit/73e341526d346a4646a4d07d0ee83eed833662fb))

# [1.12.0](https://github.com/d3p1/docker-magento/compare/v1.11.1...v1.12.0) (2024-05-13)


### Features

* request Magento version for installation in general launch script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c063a05](https://github.com/d3p1/docker-magento/commit/c063a057daa31e697e4df845bf3e93d462a1a7b2))

## [1.11.1](https://github.com/d3p1/docker-magento/compare/v1.11.0...v1.11.1) (2024-05-13)


### Bug Fixes

* adjust mkcert installation [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([677b3d4](https://github.com/d3p1/docker-magento/commit/677b3d4b0b49984b973bd2dc329ace7d593bd187))
* adjust mkcert SSL certificate generation [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([7c44294](https://github.com/d3p1/docker-magento/commit/7c442948b8f5baec9a61789815c09cbfec85ecf4))

# [1.11.0](https://github.com/d3p1/docker-magento/compare/v1.10.4...v1.11.0) (2024-05-13)


### Features

* add utility to generate SSL certificates for development environment [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([9d250d9](https://github.com/d3p1/docker-magento/commit/9d250d96e14df46dea3d496b82d6ad961e71b247))
* generate SSL certificates in launch script for development deploy [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([8f268f7](https://github.com/d3p1/docker-magento/commit/8f268f7ba1e019b68c7e5217b3b2d4f1b667e16a))

## [1.10.4](https://github.com/d3p1/docker-magento/compare/v1.10.3...v1.10.4) (2024-05-13)


### Bug Fixes

* adjust Magento deploy mode inside launch scripts [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([065ca46](https://github.com/d3p1/docker-magento/commit/065ca468cd26e68891a2d742cff30e4229ef328a))

## [1.10.3](https://github.com/d3p1/docker-magento/compare/v1.10.2...v1.10.3) (2024-05-12)


### Bug Fixes

* adjust platform init instruction inside geberal launch script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([4c3f421](https://github.com/d3p1/docker-magento/commit/4c3f42137f2029696d994839dc5cc4585a12a583))

## [1.10.2](https://github.com/d3p1/docker-magento/compare/v1.10.1...v1.10.2) (2024-05-12)


### Bug Fixes

* adjust read instruction inside geberal launch script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([04c78cd](https://github.com/d3p1/docker-magento/commit/04c78cde14b30a058c040f4e68a2cee65829a979))

## [1.10.1](https://github.com/d3p1/docker-magento/compare/v1.10.0...v1.10.1) (2024-05-12)


### Bug Fixes

* adjust domain variable inside launch script for development environment [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([71bb62d](https://github.com/d3p1/docker-magento/commit/71bb62d971230feab2735b7b142b3b339541040e))

# [1.10.0](https://github.com/d3p1/docker-magento/compare/v1.9.1...v1.10.0) (2024-05-12)


### Bug Fixes

* adjust Docker configuration logic [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([457638d](https://github.com/d3p1/docker-magento/commit/457638d53c133890a9a887506f715aac71bd4e9e))


### Features

* add utility to execute a menu for deploy script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([5d6d23f](https://github.com/d3p1/docker-magento/commit/5d6d23f36e63cf0bea1103ea19fd1782e6cc8d14))
* add utility to normalize MySQL DB dump [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([193fb8d](https://github.com/d3p1/docker-magento/commit/193fb8d0187a02c61dba6dff6872f7237c7b46bd))
* init launch script for development deploy [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([2d27fd8](https://github.com/d3p1/docker-magento/commit/2d27fd8b9c26c6e749d958a747341d53a76479e6))
* init launch script for general deploy [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c4d4c9c](https://github.com/d3p1/docker-magento/commit/c4d4c9c1a0895fef73bd22c50a8dfd97781de1d4))
* init launch script for production deploy [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([6699238](https://github.com/d3p1/docker-magento/commit/6699238cf970faab5e220dd8b1c71a8129cdeaed))

## [1.9.1](https://github.com/d3p1/docker-magento/compare/v1.9.0...v1.9.1) (2024-04-21)


### Bug Fixes

* add lost MAGENTO_COMMAND_PATH environment variable to PHP CLI (v7.3) image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([699c862](https://github.com/d3p1/docker-magento/commit/699c86229faff820c8244c62621ec49ea26f9000))

# [1.9.0](https://github.com/d3p1/docker-magento/compare/v1.8.0...v1.9.0) (2024-04-21)


### Features

* add base configure host machine script for deploy and adjust launch script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([9b0fb64](https://github.com/d3p1/docker-magento/commit/9b0fb64b4031643a8dda0f51c849d934bb313c27))
* add configure host machine script for development deploy [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([30e978c](https://github.com/d3p1/docker-magento/commit/30e978c580b973deebeccbf1f2984e7b312760c5))
* add configure host machine script for production deploy [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([121e4d3](https://github.com/d3p1/docker-magento/commit/121e4d393c4898e0b424be9da55241dbe90c804d))
* add install dependencies script to deploy environment logic [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([b8302dd](https://github.com/d3p1/docker-magento/commit/b8302dd9e1c01ceb05812c1dc51e6a0e9a4c111d))
* add reinstall script to PHP CLI images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e5d05ec](https://github.com/d3p1/docker-magento/commit/e5d05ec71a20aa5537887a751ea842c399708439))
* add utility to configure Docker for the deploy environment logic [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([3618e3a](https://github.com/d3p1/docker-magento/commit/3618e3ade0d95fb998dbec4a70863e9a898d7960))
* add utility to get host machine resource for the deploy environment logic [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([dcd03a3](https://github.com/d3p1/docker-magento/commit/dcd03a3518f1433362565a0ea67b40768fcd4a79))
* improve folder/logic structure of environment deploy script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([acbb3f2](https://github.com/d3p1/docker-magento/commit/acbb3f2cddc1279ea1ef9b7303118d3a514ddad7))
* improve Magento static content deploy strategy [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([f5096e4](https://github.com/d3p1/docker-magento/commit/f5096e41d3f34edeaefa785206f2b4170e3b602d))
* init launch script for development deploy [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([57faa03](https://github.com/d3p1/docker-magento/commit/57faa03c3048410c9d47169005eeeba424867f7e))

# [1.8.0](https://github.com/d3p1/docker-magento/compare/v1.7.0...v1.8.0) (2024-04-07)


### Bug Fixes

* add search service to dev container configuration [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([d1fc7e8](https://github.com/d3p1/docker-magento/commit/d1fc7e8f61464f20972763e0996307c4de4e6d87))


### Features

* add cron service [[#6](https://github.com/d3p1/docker-magento/issues/6)] ([e962f5d](https://github.com/d3p1/docker-magento/commit/e962f5dea4996967123596780bf3c2591dc37412))
* add host dev directory to Docker Compose development configuration file [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([2644cf4](https://github.com/d3p1/docker-magento/commit/2644cf49d5890d2d7e85bfccac570f72478ec265))
* add init profile to execute Magento installation automatically [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([1fda295](https://github.com/d3p1/docker-magento/commit/1fda2951e121b40f9ce601d064d4c729e5adb0ce))
* add script to run Magento cron in PHP CLI images [[#6](https://github.com/d3p1/docker-magento/issues/6)] ([5bc1dc9](https://github.com/d3p1/docker-magento/commit/5bc1dc9e5e8cda96ad04d34b3034db52ae4fd9d6))
* improve working dir permissions for Nginx image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([cb43e37](https://github.com/d3p1/docker-magento/commit/cb43e37c0810c89ae05c263ffd4f1c1fc70b20ca))
* improve working dir permissions for PHP-FPM images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([3b61eda](https://github.com/d3p1/docker-magento/commit/3b61eda7e243cd8b292c371563d7346ec0631d3c))
* init environment deploy script [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([8bdc103](https://github.com/d3p1/docker-magento/commit/8bdc103c7ea83aeed687eaabf2eac57ce26206d1))

# [1.7.0](https://github.com/d3p1/docker-magento/compare/v1.6.0...v1.7.0) (2024-04-07)


### Features

* add Magento cron job to PHP CLI images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([deccafe](https://github.com/d3p1/docker-magento/commit/deccafec66333cfdd185e325aa343df6af8389f4))

# [1.6.0](https://github.com/d3p1/docker-magento/compare/v1.5.0...v1.6.0) (2024-04-06)


### Bug Fixes

* adjust Magento mode as environment variable [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([6ab0ee7](https://github.com/d3p1/docker-magento/commit/6ab0ee74645923c3f5a4dd3276c36f0d16dd2472))


### Features

* add Magento mode as environment variable [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([aeedcfb](https://github.com/d3p1/docker-magento/commit/aeedcfba79ed7fe55427fa87e7079ae3d548b1e5))
* add PHP-FPM (with development purpose) image to Docker Compose development configuration [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c8db639](https://github.com/d3p1/docker-magento/commit/c8db639ef7a8f0e69960501c623da2883c3f5d76))
* add PHP-FPM (with development purpose) images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([45bcc25](https://github.com/d3p1/docker-magento/commit/45bcc25a53d5ff6233c04bd43beef287f5bfa93b))
* add www user to Nginx image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([58544c9](https://github.com/d3p1/docker-magento/commit/58544c9906b104b1e7693026a24940ea9574d26f))
* add www user to PHP CLI images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([33bea3f](https://github.com/d3p1/docker-magento/commit/33bea3fde6f8f09bd70ae5e0dbf787166eeb0eef))
* add www user to PHP-FPM (with development purpose) images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([7bae83d](https://github.com/d3p1/docker-magento/commit/7bae83d822294297a5a4c24317b79d03ca8070bc))
* add www user to PHP-FPM images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([7f304cc](https://github.com/d3p1/docker-magento/commit/7f304cc4cbe28b6eeebd33bee5249d49b369df40))
* improve dev container Magento extensions [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([a41f734](https://github.com/d3p1/docker-magento/commit/a41f7345183256568e54a6e3152a5135c84d278c))
* improve XDEBUG_HOST service name in Nginx image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([3731519](https://github.com/d3p1/docker-magento/commit/3731519341abce80cb5f1856e2bd33f19d90540c))

# [1.5.0](https://github.com/d3p1/docker-magento/compare/v1.4.0...v1.5.0) (2024-04-02)


### Bug Fixes

* adjust Magento search engine environment variable [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c1f7656](https://github.com/d3p1/docker-magento/commit/c1f765611cbc16228785ec5395d59c4bf28959ba))
* adjust Traefik configuration in containers [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([3d7d366](https://github.com/d3p1/docker-magento/commit/3d7d3666c35734799098185a39bec61bcc608a44))
* rename nginx service to web service [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([88ebd82](https://github.com/d3p1/docker-magento/commit/88ebd82b25abf3db57ddc76d5ac7c70fba22c268))


### Features

* add default Docker Compose files to setup environment [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e2d0d73](https://github.com/d3p1/docker-magento/commit/e2d0d739380a3da9c3dced8ed0e6fb9b1657b073))
* add Elasticsearch Docker Compose file [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e19944a](https://github.com/d3p1/docker-magento/commit/e19944a5812e1742d35f756e53981d2d55c4db23))
* add Magento environment values [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([3ed0bea](https://github.com/d3p1/docker-magento/commit/3ed0bea7909cc0a42fac8d75613e9deecd2870ec))
* add OpenSearch Docker Compose file [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([0e6a8db](https://github.com/d3p1/docker-magento/commit/0e6a8dbbbfbd29d9358fc659170b0444a26dae57))
* add Traefik configuration files [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([7cefc9f](https://github.com/d3p1/docker-magento/commit/7cefc9fe6fc01fe6e71231d09d279d4424ac8003))
* init base Docker Compose file [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([017d88d](https://github.com/d3p1/docker-magento/commit/017d88d7183b18bce9a3e59069d88b4b3855bfb3))
* init Docker Compose file for development environments [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([aa64ab0](https://github.com/d3p1/docker-magento/commit/aa64ab0c776cdfcdfde22f1f29e47aef8413aa5f))
* init Docker Compose file for production environments [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([6ccb43a](https://github.com/d3p1/docker-magento/commit/6ccb43a50bc8674ddf3097a94d44cf71615bf710))

# [1.4.0](https://github.com/d3p1/docker-magento/compare/v1.3.0...v1.4.0) (2024-04-01)


### Features

* add base environment variables [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c859b02](https://github.com/d3p1/docker-magento/commit/c859b029954ac83696f8cc06275e25f3eac370b2))

# [1.3.0](https://github.com/d3p1/docker-magento/compare/v1.2.0...v1.3.0) (2024-04-01)


### Bug Fixes

* adjust Elasticsearch JAVA_OPTS environment variable [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([abd9fb6](https://github.com/d3p1/docker-magento/commit/abd9fb6ae04a38450765c7c85722683bbfcb6f7c))
* adjust Magento install script of PHP CLI images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([85b2d34](https://github.com/d3p1/docker-magento/commit/85b2d34e28a8e1217e415057df594a9666caf46f))
* adjust Magento install script of PHP CLI images [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c851542](https://github.com/d3p1/docker-magento/commit/c8515429386b31411b4fb62f5072246c5d335ef1))
* improve OpenSearch image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([d9b26f0](https://github.com/d3p1/docker-magento/commit/d9b26f074eac897ab2171e0ddc22e21fe83b361e))


### Features

* add Elasticsearch service environment values [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c4e5678](https://github.com/d3p1/docker-magento/commit/c4e56786789dffb300cb1d27e37c5c0381fe8e49))
* add MariaDB service environment values [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([cbc25c8](https://github.com/d3p1/docker-magento/commit/cbc25c80f8800647f73bcf50a3bac96a846951cd))
* add Nginx service environment values [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([7d7a6a8](https://github.com/d3p1/docker-magento/commit/7d7a6a82fa913658198a3aaf41bd6ca34d3fa98b))
* add OpenSearch service environment values [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([28fc0a8](https://github.com/d3p1/docker-magento/commit/28fc0a84af5a18ede3332f5f0c6067b24c6bd4ec))
* add PHP CLI v7.3 image - add PHP-FPM v7.3 image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([daa9eb5](https://github.com/d3p1/docker-magento/commit/daa9eb5489a8a0d3516a65b2de7eca486f396645))
* add PHP CLI v8.1 image - add PHP-FPM v8.1 image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([0c647bc](https://github.com/d3p1/docker-magento/commit/0c647bce55f605079e4488e18830542a407b1da1))
* add PHP service environment values [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c3f0b8d](https://github.com/d3p1/docker-magento/commit/c3f0b8d22daaddc140b921bbd81426ef2994d26a))
* add RabbitMQ service environment values [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([86a8abb](https://github.com/d3p1/docker-magento/commit/86a8abb43d2a11a779672924402cee398e5ecb6b))
* add Traefik service environment values [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e9703ef](https://github.com/d3p1/docker-magento/commit/e9703ef461ade15d0d0d3fd02ffefa7aad7fb92c))
* init Elasticsearch image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([68739d9](https://github.com/d3p1/docker-magento/commit/68739d9daa2ea2728930dcf1ab8f97fe424cbabc))

# [1.2.0](https://github.com/d3p1/docker-magento/compare/v1.1.0...v1.2.0) (2024-03-26)


### Features

* init Docker Compose sample files [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([1247e14](https://github.com/d3p1/docker-magento/commit/1247e146b7ff7e302bd92af83c98b6f8fcccc348))
* init Magento Dev Container configuration [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([8fc4cf4](https://github.com/d3p1/docker-magento/commit/8fc4cf45ed157b4156dcc7faf434089f23e66fc8))

# [1.1.0](https://github.com/d3p1/docker-magento/compare/v1.0.0...v1.1.0) (2024-03-26)


### Bug Fixes

* improve Nginx image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([be0190e](https://github.com/d3p1/docker-magento/commit/be0190ea532ee01d483c3887b395db3896a17753))


### Features

* init MailHog image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([3302458](https://github.com/d3p1/docker-magento/commit/33024588170599f87e5e58c778c879582a955939))
* init MariaDB image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([c77c953](https://github.com/d3p1/docker-magento/commit/c77c95340efbda51605bb10df055577c3518842c))
* init Nginx image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([dfc302a](https://github.com/d3p1/docker-magento/commit/dfc302a0fb9ace18f4482521d459b3ab2f4e9941))
* init OpenSearch image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([482bf64](https://github.com/d3p1/docker-magento/commit/482bf64b8bb57de659aec9c00a6db3d24c773802))
* init RabbitMQ image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([15cc46f](https://github.com/d3p1/docker-magento/commit/15cc46f4f929a48e44f9ba1b3f51df62fc9729c7))
* init Redis image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([e0b496f](https://github.com/d3p1/docker-magento/commit/e0b496f0ff05dfb3585cdffa293d59ce0f24a480))
* init Traefik image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([21bc379](https://github.com/d3p1/docker-magento/commit/21bc3796978ffd1c2cdd1d4eba7cd0a4b8d6df2d))
* init Varnish image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([1cde064](https://github.com/d3p1/docker-magento/commit/1cde064a3c4241c997da49350021613323beafbb))

# 1.0.0 (2024-03-24)


### Features

* improve PHP CLI image scripts used to install and deploy a Magento platform [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([731aaf7](https://github.com/d3p1/docker-magento/commit/731aaf71ec8920b8973be13daec49fe98ad65206))
* init [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([45f5561](https://github.com/d3p1/docker-magento/commit/45f556112f431b2c6d05eb07e486f01334e7ca54))
* init PHP CLI image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([4813043](https://github.com/d3p1/docker-magento/commit/4813043eea2a5fd5a49325974599b12e4ec870c5))
* init PHP-FPM image [[#1](https://github.com/d3p1/docker-magento/issues/1)] ([9f6829f](https://github.com/d3p1/docker-magento/commit/9f6829f37069409992be4586cc6b83fed6c542b2))
