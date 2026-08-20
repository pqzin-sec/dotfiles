apkpull() {
  if [[ -z "$1" ]]; then
    echo "Usage: apkpull <package>"
    return 1
  fi

  adb shell pm path "$1" \
    | cut -d: -f2 \
    | tr -d '\r' \
    | xargs -I {} adb pull {} >/dev/null 2>&1

  echo "[+] Downloaded APK files:"
  eza --color=always --icons=always *.apk
}

update-zshrc() {
  echo "[+] Reloading ~/.zshrc..."
  source ~/.zshrc
  echo "[+] Reloaded ~/.zshrc"
}

coding() {
  local base="$HOME/Documents/codes"
  local dir="$base"

  if [[ -n "$1" ]]; then
    dir="$base/$1"

    if [[ ! -d "$dir" ]]; then
      echo "[-] Project not found: $1"
      echo "[+] Available projects:"
      eza --color=always --icons=always --only-dirs "$base"
      return 1
    fi

    cd "$dir" || return 1
    code .
    echo "[+] Opened project: $1"
    eza --color=always --icons=always --long --git --no-permissions --no-user
    return
  fi

  echo "[+] Available projects:"
  eza --color=always --icons=always --only-dirs "$base"
}

_coding() {
  _arguments '1:project:_files -/ -W "$HOME/Documents/codes"'
}

compdef _coding coding

http() {
  local port="${1:-8000}"
  echo "[+] Starting HTTP server on port $port..."
  python3 -m http.server "$port"
}

mkcd() {
  if [[ -z "$1" ]]; then
    echo "Usage: mkcd <directory>"
    return 1
  fi

  command mkdir -p "$1"
  cd "$1" || return
}

my-ip() {
  echo "[+] Fetching external IP address..."
  curl -4 -s https://ifconfig.me
  echo
}

brewup() {
  brew update &&
  brew upgrade &&
  brew cleanup
}