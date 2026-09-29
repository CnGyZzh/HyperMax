#!/system/bin/sh
MODDIR=${0%/*}
MODE="$1"
SVC='vendor.xiaomi.hw.touchfeature.ITouchFeature/default'
LIVE='/odm/firmware/pandora_syna_thp_config.ini'
P300="$MODDIR/profiles/touch/300.ini"
STOCK="$MODDIR/backup/pandora_syna_thp_config.stock.ini"
mkdir -p "$MODDIR/state" "$MODDIR/backup"

set_mode() {
  out=$(service call "$SVC" 9 i32 0 i32 "$1" i32 "$2" 2>&1)
  rc=$?
  [ "$rc" -eq 0 ] || return 1
  echo "$out" | grep -qiE 'unknown service|not found|exception|error' && return 1
  return 0
}

stock_rate() {
  r=''
  if [ -f "$STOCK" ]; then
    r=$(awk -F= '/^[[:space:]]*rate_normal[[:space:]]*=/{gsub(/[[:space:]\r]/,"",$2); print $2; exit}' "$STOCK" 2>/dev/null)
  fi
  case "$r" in
    ''|*[!0-9]*) r=240 ;;
  esac
  echo "$r"
}

apply_stock_runtime() {
  r=$(stock_rate)
  # Clear HyperMax performance toggles, then restore the stock report-rate value parsed from the backed-up OEM file.
  set_mode 220 0 >/dev/null 2>&1
  set_mode 3058 1 >/dev/null 2>&1
  set_mode 1084 0 >/dev/null 2>&1
  set_mode 204 0 >/dev/null 2>&1
  set_mode 202 0 >/dev/null 2>&1
  set_mode 205 0 >/dev/null 2>&1
  set_mode 1011 "$r" >/dev/null 2>&1
}

apply_300_runtime() {
  set_mode 220 0 >/dev/null 2>&1
  set_mode 3058 1 >/dev/null 2>&1
  set_mode 1084 1 >/dev/null 2>&1
  set_mode 204 1 >/dev/null 2>&1
  set_mode 1011 300 >/dev/null 2>&1
  set_mode 202 1 >/dev/null 2>&1
  set_mode 205 2 >/dev/null 2>&1
}

case "$MODE" in
  stock)
    # Mark stock first so any delayed boot retry cannot switch it back to 300 while this command is running.
    echo stock > "$MODDIR/state/touch"
    sync
    umount "$LIVE" >/dev/null 2>&1 || true
    # If the OEM file was backed up at boot, the unmount above exposes that original file again.
    apply_stock_runtime
    sync
    echo 'OK:stock'
    ;;
  300)
    [ -f "$P300" ] || { echo 'ERR:300Hz profile missing'; exit 3; }
    [ -e "$LIVE" ] || { echo 'ERR:stock touch config path missing'; exit 4; }
    echo 300 > "$MODDIR/state/touch"
    sync
    umount "$LIVE" >/dev/null 2>&1 || true
    mount --bind "$P300" "$LIVE" || { echo 'ERR:300Hz bind mount failed'; exit 5; }
    restorecon "$LIVE" >/dev/null 2>&1 || true
    apply_300_runtime
    sync
    echo 'OK:300'
    ;;
  *)
    echo 'ERR:unsupported touch mode'
    exit 2
    ;;
esac
