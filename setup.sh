#!/bin/bash

if [[ $1 == "enmod" ]]; then
  ./vendor/bin/drush en adminimal_admin_toolbar admin_toolbar_tools backup_migrate editor_advanced_link image_effects pathauto twig_field_value twig_tweak
else
  composer install

  cp example.gitignore .gitignore

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

  cp sites/default/default.services.yml sites/default/services.yml
fi
