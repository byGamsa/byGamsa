#!/bin/sh
# Renders the profile banner (light and dark) to PNG with a transparent background.
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
ROOT="$(cd "$(dirname "$0")/.." && pwd -W)"
for t in light dark; do
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=15000 \
    --default-background-color=00000000 --force-device-scale-factor=2 --window-size=1200,420 \
    --screenshot="$ROOT/.github/assets/banner-$t.png" "file:///$ROOT/.design/banner.html?$t" 2>/dev/null
done
