#!/bin/sh
# Renders the selected-work tiles (light and dark) to .github/assets/tiles/<id>-<theme>.png.
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
ROOT="$(cd "$(dirname "$0")/../.." && pwd -W)"
shot() { # id width height
  for t in light dark; do
    "$CHROME" --headless=new --disable-gpu --hide-scrollbars --virtual-time-budget=10000 \
      --default-background-color=00000000 --force-device-scale-factor=2 --window-size=$2,$3 \
      --screenshot="$ROOT/.github/assets/tiles/$1-$t.png" "file:///$ROOT/.design/tiles/tiles.html?tile=$1&theme=$t" 2>/dev/null
  done
}
shot pulse 420 340
shot dendree 420 340
for id in databack waste speech sdi; do shot $id 210 236; done
