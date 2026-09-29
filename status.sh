#!/system/bin/sh
MODDIR=${0%/*}
TOUCH=$(cat "$MODDIR/state/touch" 2>/dev/null | tr -d '[:space:]')
case "$TOUCH" in stock|300) ;; *) TOUCH=300;; esac
REFRESH=$(cat "$MODDIR/state/refresh" 2>/dev/null | tr -d '[:space:]')
case "$REFRESH" in 144|120|90|60) ;; *) REFRESH=144;; esac
THERMAL=$(cat /data/vendor/thermal/config/files.ini 2>/dev/null | tr -d '[:space:]')
case "$THERMAL" in cool|pro|extreme|danger) ;; *) THERMAL=$(cat "$MODDIR/state/thermal" 2>/dev/null | tr -d '[:space:]');; esac
case "$THERMAL" in cool|pro|extreme|danger) ;; *) THERMAL=pro;; esac
printf 'touch=%s\nrefresh=%s\nthermal=%s\n' "$TOUCH" "$REFRESH" "$THERMAL"
