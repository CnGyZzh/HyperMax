#!/system/bin/sh
MODDIR=${0%/*}; MODE="$1"
case "$MODE" in
  144) MID=0 ;;
  120) MID=2 ;;
  90)  MID=3 ;;
  60)  MID=4 ;;
  *) echo "ERR:unsupported refresh rate"; exit 2 ;;
esac
V="$MODE.0"
# Keep HyperOS policy keys coherent, then force the physical display mode through SF 1035.
settings put system min_refresh_rate "$V" || exit 3
settings put system peak_refresh_rate "$V" || exit 3
settings put system user_refresh_rate "$MODE" 2>/dev/null
settings put system miui_refresh_rate "$MODE" 2>/dev/null
settings put system screen_refresh_rate "$MODE" 2>/dev/null
settings put secure min_refresh_rate "$V" 2>/dev/null
settings put secure peak_refresh_rate "$V" 2>/dev/null
settings put secure user_refresh_rate "$MODE" 2>/dev/null
settings put secure miui_refresh_rate "$MODE" 2>/dev/null
settings put global default_refresh_rate "$V" 2>/dev/null
settings put global match_content_frame_rate 0 2>/dev/null

OUT=$(service call SurfaceFlinger 1035 i32 "$MID" 2>&1)
RC=$?
[ "$RC" -eq 0 ] || { echo "ERR:SurfaceFlinger transaction failed:$OUT"; exit 4; }
sleep 0.35
# Read the first/main-display activeMode only. On this device it is 1220x2656.
ACT=$(dumpsys SurfaceFlinger 2>/dev/null | grep -m1 'activeMode=.*resolution=1220x2656' | sed -n 's/.*vsyncRate=\([0-9.]*\) Hz.*/\1/p')
ACTI=$(printf '%s' "$ACT" | cut -d. -f1)
[ "$ACTI" = "$MODE" ] || { echo "ERR:requested=${MODE}Hz actual=${ACT:-unknown}Hz modeId=$MID"; exit 5; }
mkdir -p "$MODDIR/state"; echo "$MODE" > "$MODDIR/state/refresh"
echo "OK:$MODE;ACTUAL=$ACT;MODEID=$MID"
