#!/bin/bash

composer install

cp example.gitignore .gitignore

mkdir tmp && chmod -R a+w tmp

mkdir -p sites/default/files/private && chmod -R a+w sites/default/files/private
chmod -R a+w sites/default/files

SETTINGS_PHP="sites/default/settings.php"
if [ ! -f $SETTINGS_PHP ]; then
  cp sites/default/default.settings.php sites/default/settings.php && chmod -R a+w sites/default/settings.php
  echo "${SETTINGS_PHP} has been created and granted write access"
fi

cp sites/default/default.services.yml sites/default/services.yml

