#!/bin/bash

USERNAME=admin
COOKIES=cookies.txt

if [ -z "$HOST" ]; then
  HOST="http://127.0.0.1:8000"
fi
if [ -z "$URL_PREFIX" ]; then
  URL_PREFIX="django-admin-keyshortcuts-demo/main"
fi

touch $COOKIES
expiry_timestamp=$(($(date +%s) + 24 * 60 * 60))
echo "127.0.0.1:8000	FALSE	/	FALSE	$expiry_timestamp	auto_login	$USERNAME" > $COOKIES

wget \
  --no-host-directories \
  --directory-prefix=snapshot_data \
  --mirror \
  --reject-regex "(.*)\?(.*)" \
  --load-cookies "$COOKIES" \
  "$HOST"

wget \
  --no-host-directories \
  --directory-prefix="snapshot_data/$URL_PREFIX/static/admin/js/vendor/hotkey/hotkey.js" \
  --load-cookies "$COOKIES" \
  "$HOST/$URL_PREFIX/static/admin/js/vendor/hotkey/hotkey.js"

cp snapshot_data/index.html snapshot_data/$URL_PREFIX/index.html