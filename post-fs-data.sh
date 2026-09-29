#!/system/bin/sh
MODDIR=${0%/*}
LIVE='/odm/firmware/pandora_syna_thp_config.ini'
P300="$MODDIR/profiles/touch/300.ini"
STOCK="$MODDIR/backup/pandora_syna_thp_config.stock.ini"
mkdir -p "$MODDIR/state" "$MODDIR/backup"

# Capture the real OEM file before HyperMax overlays it. Bind mounts do not survive reboot,
# so this runs while the underlying /odm file is visible.
if [ -e "$LIVE" ] && [ ! -s "$STOCK" ]; then
  cp -af "$LIVE" "$STOCK" 2>/dev/null
  chmod 0644 "$STOCK" 2>/dev/null
fi

# User preference: every boot starts in 300 Hz mode.
if [ -f "$P300" ] && [ -e "$LIVE" ]; then
  umount "$LIVE" >/dev/null 2>&1 || true
  mount --bind "$P300" "$LIVE" >/dev/null 2>&1
  restorecon "$LIVE" >/dev/null 2>&1 || true
fi
echo 300 > "$MODDIR/state/touch"
