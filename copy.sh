#!/bin/bash

DST="out${BASE_PATH}"

for app in demos/*; do
  if [ -d "$app/dist" ]; then
    app_name=$(basename "$app")
    mkdir -p "$DST/$app_name"
    cp -r "$app/dist/"* "$DST/$app_name/"
    
    SNAPSHOT_FILE=$(ls test/e2e/snapshot.test.js-snapshots/${app_name}-*.png 2>/dev/null)
    if [ -n "$SNAPSHOT_FILE" ]; then
      cp "$SNAPSHOT_FILE" "$DST/$app_name/thumbnail.png"
    fi
    
    echo "Copied $app/dist to $DST/$app_name"
  fi
done

cp -r apps/website/out/* $DST/
echo "Copied apps/website/out to $DST"