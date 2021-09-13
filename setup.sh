#!/bin/sh
mkdir tmp && chmod -R a+w tmp
composer -V && composer install
if [ ! -f ".gitignore" ]; then
  cp example.gitignore .gitignore
elif [ ! -f "sites/default/files/private" ]; then
  mkdir -p sites/default/files/private && chmod -R a+w sites/default/files/private
  chmod -R a+w sites/default/files
elif [ ! -f ]; then
  cp sites/default/default.settings.php sites/default/settings.php && chmod -R a+w sites/default/settings.php
  echo "sites/default/settings.php has been created and granted write access"
elif [ ! -f "sites/default/services.yml" ]; then
  cp sites/default/default.services.yml sites/default/services.yml
else
  echo "setup complete!"
fi

