#!/bin/sh

##
# @description Install Magento 2 platform
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @note        The Magento Cloud PHP CLI image already includes a script to 
#              install Magento, but it is believed that it may not work properly 
#              for this project
# @link        https://github.com/magento/magento-cloud-docker/blob/develop/images/php/cli/bin/magento-installer
# @link        https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/composer
# @link        https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/advanced
# @link        https://github.com/markshust/docker-magento/blob/master/compose/bin/setup-install
##

##
# 
# @note Add flag to exit script if there is an error related to a command
#       or if it is used an undefined variable
##
set -eu

##
# Main
#
# @return void
##
main() {
    ##
    # @note Create Magento project
    ##
    composer create-project \
    --repository-url=https://repo.magento.com/ \
    magento/project-community-edition="$MAGENTO_VERSION" \
    .

    ##
    # @note Install Magento
    ##
    bin/magento setup:install \
    --db-host="$MAGENTO_DB_HOST" \
    --db-name="$MAGENTO_DB_NAME" \
    --db-user="$MAGENTO_DB_USER" \
    --db-password="$MAGENTO_DB_PASSWORD" \
    --base-url="$MAGENTO_BASE_URL" \
    --base-url-secure="$MAGENTO_BASE_URL_SECURE" \
    --backend-frontname="$MAGENTO_BACKEND_FRONTNAME" \
    --admin-firstname="$MAGENTO_ADMIN_FIRSTNAME" \
    --admin-lastname="$MAGENTO_ADMIN_LASTNAME" \
    --admin-email="$MAGENTO_ADMIN_EMAIL" \
    --admin-user="$MAGENTO_ADMIN_USER" \
    --admin-password="$MAGENTO_ADMIN_PASSWORD" \
    --language="$MAGENTO_LANGUAGE" \
    --currency="$MAGENTO_CURRENCY" \
    --timezone="$MAGENTO_TIMEZONE" \
    --amqp-host="$MAGENTO_AMQP_HOST" \
    --amqp-port="$MAGENTO_AMQP_PORT" \
    --amqp-user="$MAGENTO_AMQP_USER" \
    --amqp-password="$MAGENTO_AMQP_PASSWORD" \
    --amqp-virtualhost="$MAGENTO_AMQP_VIRTUALHOST" \
    --cache-backend="$MAGENTO_CACHE_BACKEND" \
    --cache-backend-redis-server="$MAGENTO_CACHE_BACKEND_REDIS_SERVER" \
    --cache-backend-redis-db="$MAGENTO_CACHE_BACKEND_REDIS_DB" \
    --page-cache="$MAGENTO_PAGE_CACHE" \
    --page-cache-redis-server="$MAGENTO_PAGE_CACHE_REDIS_SERVER" \
    --page-cache-redis-db="$MAGENTO_PAGE_CACHE_REDIS_DB" \
    --session-save="$MAGENTO_SESSION_SAVE" \
    --session-save-redis-host="$MAGENTO_SESSION_SAVE_REDIS_HOST" \
    --session-save-redis-log-level="$MAGENTO_SESSION_SAVE_REDIS_LOG_LEVEL" \
    --session-save-redis-db="$MAGENTO_SESSION_SAVE_REDIS_DB" \
    --opensearch-host="$MAGENTO_SEARCH_HOST" \
    --opensearch-port="$MAGENTO_SEARCH_PORT" \
    --search-engine="$MAGENTO_SEARCH_ENGINE" \
    --use-rewrites=1 \
    --cleanup-database \
    --no-interaction

    ##
    # @note Return with success
    ##
    return 0;
}

##
# @note Install Magento
##
main "$@"