#!/bin/sh

composer -V && composer install

#FILES=( ".gitignore" "sites/default/files/private" "sites/default/settings.php" "sites/default/services.yml")

if [ ! -f ".gitignore" ]; then
  cp example.gitignore .gitignore
fi

mkdir tmp && chmod -R a+w tmp

if [ ! -f "sites/default/files/private" ]; then
  mkdir -p sites/default/files/private && chmod -R a+w sites/default/files/private
  chmod -R a+w sites/default/files
fi

SETTINGS_PHP="sites/default/settings.php"
if [ ! -f $SETTINGS_PHP ]; then
  cp sites/default/default.settings.php sites/default/settings.php && chmod -R a+w sites/default/settings.php
  echo "${SETTINGS_PHP} has been created and granted write access"
fi

if [ ! -f "sites/default/services.yml" ]; then
  cp sites/default/default.services.yml sites/default/services.yml
fi

