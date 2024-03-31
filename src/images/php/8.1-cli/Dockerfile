##
# @description PHP CLI (v8.1) image for a Magento 2 environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @link        https://github.com/d3p1/docker-magento
##

##
# @note Use official Magento Cloud image
# @note Add custom scripts to init, install and deploy a Magento platform
# @link https://hub.docker.com/r/magento/magento-cloud-docker-php
# @link https://github.com/magento/magento-cloud-docker/blob/develop/images/php/cli/Dockerfile
##
FROM magento/magento-cloud-docker-php:8.1-cli-1.4.0
    ##
    # @note Init environment variables required to install a Magento platform
    # @note It is used `MAGENTO_` as a prefix for these environment variables
    #       to distinguish them from other variables that are not related
    #       to Magento installation/configuration
    ##
    ENV MAGENTO_VERSION="2.4.6"
    ENV MAGENTO_DB_HOST="db"
    ENV MAGENTO_DB_NAME="magento"
    ENV MAGENTO_DB_USER="magento"
    ENV MAGENTO_DB_PASSWORD="magento"
    ENV MAGENTO_BASE_URL="http://magento.test/"
    ENV MAGENTO_BASE_URL_SECURE="https://magento.test/"
    ENV MAGENTO_BACKEND_FRONTNAME="admin"
    ENV MAGENTO_ADMIN_FIRSTNAME="Test F"
    ENV MAGENTO_ADMIN_LASTNAME="Test L"
    ENV MAGENTO_ADMIN_EMAIL="test@test.com"
    ENV MAGENTO_ADMIN_USER="admin"
    ENV MAGENTO_ADMIN_PASSWORD="Test123456."
    ENV MAGENTO_LANGUAGE="en_US"
    ENV MAGENTO_CURRENCY="USD"
    ENV MAGENTO_TIMEZONE="America/New_York"
    ENV MAGENTO_AMQP_HOST="rabbitmq"
    ENV MAGENTO_AMQP_PORT="5672"
    ENV MAGENTO_AMQP_USER="magento"
    ENV MAGENTO_AMQP_PASSWORD="magento"
    ENV MAGENTO_AMQP_VIRTUALHOST="/"
    ENV MAGENTO_CACHE_BACKEND="redis"
    ENV MAGENTO_CACHE_BACKEND_REDIS_SERVER="redis"
    ENV MAGENTO_CACHE_BACKEND_REDIS_DB="0"
    ENV MAGENTO_PAGE_CACHE="redis"
    ENV MAGENTO_PAGE_CACHE_REDIS_SERVER="redis"
    ENV MAGENTO_PAGE_CACHE_REDIS_DB="1"
    ENV MAGENTO_SESSION_SAVE="redis"
    ENV MAGENTO_SESSION_SAVE_REDIS_HOST="redis"
    ENV MAGENTO_SESSION_SAVE_REDIS_LOG_LEVEL="4"
    ENV MAGENTO_SESSION_SAVE_REDIS_DB="2"
    ENV MAGENTO_SEARCH_HOST="opensearch"
    ENV MAGENTO_SEARCH_PORT="9200"
    ENV MAGENTO_SEARCH_ENGINE="opensearch"
    ENV MAGENTO_STATIC_CONTENT_DEPLOY_JOBS="2"

    ##
    # @note Add custom scripts to install and deploy a Magento platform
    ##
    COPY bin/install.sh /usr/local/bin/
    COPY bin/deploy.sh /usr/local/bin/
    COPY bin/init.sh /usr/local/bin/
    RUN chmod +x /usr/local/bin/install.sh
    RUN chmod +x /usr/local/bin/deploy.sh
    RUN chmod +x /usr/local/bin/init.sh