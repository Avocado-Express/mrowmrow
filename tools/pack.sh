#!/bin/bash

#!https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

npx @electron/asar pack $SCRIPT_DIR/../app_unpacked $SCRIPT_DIR/../squashfs-root/resources/app.asar
npx @electron/asar pack $SCRIPT_DIR/../obsidian_unpacked $SCRIPT_DIR/../squashfs-root/resources/obsidian.asar

$SCRIPT_DIR/appimagetool-x86_64.AppImage $SCRIPT_DIR/../squashfs-root $SCRIPT_DIR/../created_obsidan.AppImage

$SCRIPT_DIR/../created_obsidan.AppImage