#!/bin/sh
git clone https://github.com/drush-ops/drush.git
mkdir tmp && chmod -R a+w tmp
composer -V && composer install
GITIGNORE=".gitignore"
if [ ! -f $GITIGNORE ]; then
  cp example.gitignore $GITIGNORE
fi
PRIVATE_FILE="sites/default/files/private"
if [ ! -d $PRIVATE_FILE ]; then
  mkdir -p sites/default/files/private && chmod -R a+w sites/default/files/private
  chmod -R a+w sites/default/files
fi
SETTINGS_PHP="sites/default/settings.php"
if [ ! -f $SETTINGS_PHP ]; then
  cp sites/default/default.settings.php sites/default/settings.php && chmod -R a+w $SETTINGS_PHP
  echo "${SETTINGS_PHP} has been created and granted write access"
fi
SERVICES_YML="sites/default/services.yml"
if [ ! -f $SERVICES_YML ]; then
  cp sites/default/default.services.yml $SERVICES_YML
fi
