#!/system/bin/sh
MODDIR=${0%/*}; MODE="$1"
case "$MODE" in cool|pro|extreme|danger) ;; *) echo "ERR:unsupported thermal profile"; exit 2;; esac
DEVICE=$(getprop ro.product.device); SRC="$MODDIR/$DEVICE/$MODE"; TDIR=/data/vendor/thermal; DST="$TDIR/config"
generate(){
  TF=$(find /vendor /odm -type f -name thermal-normal.conf 2>/dev/null | head -n 1)
  [ -n "$TF" ] || return 1
  TD=${TF%/*}
  chmod 0755 "$MODDIR/functions/Eclipse" "$MODDIR/functions/miui-thermal" 2>/dev/null
  mkdir -p "$MODDIR/$DEVICE"
  "$MODDIR/functions/Eclipse" "$TD" "$MODDIR/$DEVICE" "$MODDIR/functions/miui-thermal" || return 1
  for P in cool pro extreme danger; do
    [ -d "$MODDIR/$DEVICE/$P" ] && [ -n "$(ls -A "$MODDIR/$DEVICE/$P" 2>/dev/null)" ] || return 1
  done
  return 0
}
[ -d "$SRC" ] && [ -n "$(ls -A "$SRC" 2>/dev/null)" ] || generate >/dev/null 2>&1
[ -d "$SRC" ] && [ -n "$(ls -A "$SRC" 2>/dev/null)" ] || { echo "ERR:profile generation failed device=$DEVICE"; exit 3; }
TMP="/data/local/tmp/hypermax_thermal.$$"; rm -rf "$TMP"; mkdir -p "$TMP" || exit 4
cp -af "$SRC"/. "$TMP"/ || { rm -rf "$TMP"; echo "ERR:stage failed"; exit 5; }
chattr -i "$TDIR" "$DST" 2>/dev/null
find "$DST" -type f -exec chattr -i {} \; 2>/dev/null
mkdir -p "$DST" || exit 6
find "$DST" -mindepth 1 -maxdepth 1 -exec rm -rf {} \; 2>/dev/null
cp -af "$TMP"/. "$DST"/ || { rm -rf "$TMP"; echo "ERR:copy failed"; exit 7; }
rm -rf "$TMP"
printf '%s\n' "$MODE" > "$DST/files.ini" || { echo "ERR:state write failed"; exit 8; }
chmod -R 0771 "$TDIR" 2>/dev/null; chown -R root:system "$DST" 2>/dev/null
chown root:system "$TDIR/decrypt.txt" 2>/dev/null
chown system:system "$TDIR/report.dump" "$TDIR/thermal-global-mode" "$TDIR/thermal.dump" 2>/dev/null
restorecon -DFR "$TDIR" 2>/dev/null
find "$DST" -type f ! -name files.ini -exec chattr +i {} \; 2>/dev/null
mkdir -p "$MODDIR/state"; echo "$MODE" > "$MODDIR/state/thermal"; sync
ACT=$(tr -d '[:space:]' < "$DST/files.ini" 2>/dev/null)
[ "$ACT" = "$MODE" ] || { echo "ERR:verify failed actual=$ACT"; exit 9; }
echo "OK:$MODE"
