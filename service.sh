#!/system/bin/sh
MODDIR=${0%/*}
until [ "$(getprop sys.boot_completed)" = "1" ]; do sleep 2; done
sleep 4

# Default every boot: 144 Hz, regardless of the last manual selection.
echo 144 > "$MODDIR/state/refresh"
sh "$MODDIR/refresh.sh" 144 boot >/dev/null 2>&1
# HyperOS may rewrite display policy shortly after boot; two finite retries keep overhead near zero.
(
  sleep 10
  sh "$MODDIR/refresh.sh" 144 boot >/dev/null 2>&1
  sleep 15
  sh "$MODDIR/refresh.sh" 144 boot >/dev/null 2>&1
) &

# Keep the selected thermal profile behavior unchanged.
T=$(cat "$MODDIR/state/thermal" 2>/dev/null)
case "$T" in cool|pro|extreme|danger) ;; *) T=pro;; esac
sh "$MODDIR/thermal.sh" "$T" >/dev/null 2>&1

# Default every boot: 300 Hz touch.
echo 300 > "$MODDIR/state/touch"
sh "$MODDIR/touch.sh" 300 >/dev/null 2>&1

# One delayed HAL reapply is enough. Crucially, never override a manual switch to stock.
(
  sleep 15
  [ "$(cat "$MODDIR/state/touch" 2>/dev/null)" = "300" ] && \
    sh "$MODDIR/touch.sh" 300 >/dev/null 2>&1
) &
