#!/bin/bash

composer install

cp example.gitignore .gitignore

mkdir tmp && chmod -R a+w tmp

SETTINGS_PHP="sites/default/settings.php"
if [ -f $SETTINGS_PHP ]; then
    echo "${SETTINGS_PHP} exists"
    else
      cp sites/default/default.settings.php sites/default/settings.php && chmod -R a+w sites/default/settings.php
      echo 'sites/default/settings.php has been created and granted write access'
fi

cp sites/default/default.services.yml sites/default/services.yml

