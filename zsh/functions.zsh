apkpull() {
  if [[ -z "$1" ]]; then
    echo "Usage: apkpull <package>"
    return 1
  fi

  adb shell pm path "$1" \
    | cut -d: -f2 \
    | tr -d '\r' \
    | xargs -I {} adb pull {} >/dev/null 2>&1

  ls -l -- *.apk
}