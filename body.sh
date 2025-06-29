#!/bin/sh -e

BASE_DOWNLOAD_URL="https://github.com/ForgejoTest/Test/releases/download"
TAG=${FORGEJO_NUMBER}-${FORGEJO_REF}

row() {
  ARCH="$1"
  PRETTY_ARCH="$2"
  DESCRIPTION="$3"

  echo -n "| "
  echo -n "[$PRETTY_ARCH](${BASE_DOWNLOAD_URL}/${TAG}/Eden-Linux-${FORGEJO_NUMBER}-${FORGEJO_REF}-${ARCH}.AppImage) | "
  echo -n "$DESCRIPTION |"
  echo
}

win() {
  ARCH="$1"
  PRETTY_ARCH="$2"
  DESCRIPTION="$3"

  echo -n "| "
  echo -n "[$PRETTY_ARCH](${BASE_DOWNLOAD_URL}/${TAG}/Eden-Windows-${FORGEJO_NUMBER}-${FORGEJO_REF}-${ARCH}.zip) | "
  echo -n "$DESCRIPTION |"
  echo
}

echo "# $FORGEJO_TITLE"
echo
echo "This is pull request number $FORGEJO_NUMBER, ref \`$FORGEJO_REF\` of Eden."
echo "Its specific changelog and description can be found [here]($FORGEJO_PR_URL)."
echo
echo "## Notice"
echo
echo "These builds are provided **as-is**. They are intended for testers and developers ONLY."
echo "They are made available to the public in the interest of maximizing user freedom, but you"
echo "**will NOT receive support** while using these builds, *unless* you have useful debug/testing"
echo "info to share."
echo
echo "Furthermore, sharing these builds and claiming they are the \"official\" or \"release\""
echo "builds is **STRICTLY FORBIDDEN** and may result in further action from the Eden development team."
echo
echo "## Packages"
echo
echo "### Linux"
echo
echo "Linux packages are packaged via AppImage. Each build is optimized for a specific architecture."
echo "See the *Description* column for more info."
echo
echo "| Build | Description |"
echo "| ----- | ----------- |"
row legacy "amd64 (legacy)" "For CPUs older than 2013 or so"
row amd64 "amd64" "For any modern AMD or Intel CPU"
row steamdeck "Steam Deck" "For Steam Deck and other >= Zen 2 AMD CPUs"
row rog-ally "ROG Ally X" "For ROG Ally X and other >= Zen 4 AMD CPUs"
row aarch64 "armv8-a" "For ARM CPUs made in mid-2021 or earlier"
row armv9 "armv9-a" "For ARM CPUs made in late 2021 or later"
echo
echo "### Windows"
echo
echo "Windows packages are in-place zip files."
echo
echo "| Build | Description |"
echo "| ----- | ----------- |"
win amd64 amd64 "For any Windows machine running an AMD or Intel CPU"
echo "| arm64 (WIP) | For For any Windows machine running a Qualcomm or other ARM-based SoC. Currently a work-in-progress."
# win arm64 aarch64 "For any Windows machine running a Qualcomm or other ARM-based SoC"
echo
echo "### Android"
echo
echo "Android comes in a single APK."
echo
echo "[Android APK](${BASE_DOWNLOAD_URL}/${TAG}/Eden-Android-${FORGEJO_NUMBER}-${FORGEJO_REF}.apk)"
echo