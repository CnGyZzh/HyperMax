SKIPUNZIP=0
ui_print "*******************************"
ui_print "          HyperMax v2.2"
ui_print "     Xiaomi 17 Pro · Gy"
ui_print "*******************************"
ui_print "- 不刷写DTBO；144Hz需设备已具备144Hz显示模式"
ui_print "- 正在生成四档温控配置…"
DEVICE=$(getprop ro.product.device)
THERMAL_FILE=$(find /vendor /odm -type f -name thermal-normal.conf 2>/dev/null | head -n 1)
THERMAL_DIR=""
[ -n "$THERMAL_FILE" ] && THERMAL_DIR=${THERMAL_FILE%/*}
if [ -n "$THERMAL_DIR" ] && [ -f "$MODPATH/functions/Eclipse" ] && [ -f "$MODPATH/functions/miui-thermal" ]; then
  mkdir -p "$MODPATH/$DEVICE"
  set_perm_recursive "$MODPATH/functions" 0 0 0755 0755
  chmod 0755 "$MODPATH/functions/Eclipse" "$MODPATH/functions/miui-thermal" 2>/dev/null
  if "$MODPATH/functions/Eclipse" "$THERMAL_DIR" "$MODPATH/$DEVICE" "$MODPATH/functions/miui-thermal"; then
    if for P in cool pro extreme danger; do [ -d "$MODPATH/$DEVICE/$P" ] && [ -n "$(ls -A "$MODPATH/$DEVICE/$P" 2>/dev/null)" ] || { ui_print "! $P 配置为空"; rm -rf "$MODPATH/$DEVICE"; exit 1; }; done; true; then
      ui_print "- 四档温控配置生成完成：$THERMAL_DIR"
    else
      ui_print "! 生成器返回成功，但四档配置不完整；已禁用温控切换保护系统配置"
      rm -rf "$MODPATH/$DEVICE"
    fi
  else
    ui_print "! 温控配置生成失败：WebUI 温控页将拒绝执行，避免清空系统配置"
  fi
else
  ui_print "! 未找到 thermal-normal.conf 或生成器不可用"
fi
ui_print "- 保留轻量温控生成器用于缺失配置自动修复"
mkdir -p "$MODPATH/state"
echo 300 > "$MODPATH/state/touch"
echo 144 > "$MODPATH/state/refresh"
[ -f "$MODPATH/state/thermal" ] || echo pro > "$MODPATH/state/thermal"
set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm "$MODPATH/touch.sh" 0 0 0755
set_perm "$MODPATH/refresh.sh" 0 0 0755
set_perm "$MODPATH/thermal.sh" 0 0 0755
set_perm "$MODPATH/status.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
