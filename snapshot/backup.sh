#!/bin/bash

USERNAME=admin
COOKIES=cookies.txt

if [ -z "$HOST" ]; then
  HOST="http://127.0.0.1:8000"
fi

touch $COOKIES
expiry_timestamp=$(($(date +%s) + 24 * 60 * 60))
echo "127.0.0.1:8000	FALSE	/	FALSE	$expiry_timestamp	auto_login	$USERNAME" > $COOKIES

wget --no-host-directories -P ./django_admin_demo_snapshot --mirror --no-parent --reject-regex "(.*)\?(.*)" --load-cookies $COOKIES $HOST
wget --no-host-directories -P ./django_admin_demo_snapshot/static/admin/js/vendor/hotkey --load-cookies $COOKIES $HOST/django-admin-keyshortcuts-demo/static/admin/js/vendor/hotkey/hotkey.js

mv ./django_admin_demo_snapshot/index.html ./django_admin_demo_snapshot/django-admin-keyshortcuts-demo/index.html
