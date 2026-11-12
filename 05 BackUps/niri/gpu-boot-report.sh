#!/bin/sh
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/1000}"
export DISPLAY=:0
i=0
while [ "$i" -lt 90 ]; do
    ws=$(ls "$XDG_RUNTIME_DIR"/wayland-* 2>/dev/null | grep -v '\.lock$' | head -1)
    ns=$(ls "$XDG_RUNTIME_DIR"/niri.wayland-*.sock 2>/dev/null | head -1)
    if [ -n "$ws" ] && [ -n "$ns" ] && [ -S /tmp/.X11-unix/X0 ]; then
        break
    fi
    i=$((i + 1))
    sleep 1
done
[ -n "$ws" ] && export WAYLAND_DISPLAY=$(basename "$ws")
[ -n "$ns" ] && export NIRI_SOCKET="$ns"
{
    echo "=== date ==="; date
    echo "=== kernel ==="; uname -r
    echo "=== cmdline ==="; cat /proc/cmdline
    echo "=== lsmod ==="; lsmod | grep -E 'nvidia|nouveau|i915' || true
    echo "=== lspci -k ==="; lspci -k | grep -A3 -E 'VGA|3D' || true
    echo "=== dkms ==="; dkms status 2>&1 || true
    echo "=== nvidia-smi ==="; nvidia-smi 2>&1 || true
    echo "=== niri msg outputs ==="; niri msg outputs 2>&1 || true
    echo "=== glxinfo default ==="; glxinfo -B 2>&1 || true
    echo "=== glxinfo offload nvidia ==="; __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo -B 2>&1 || true
} > /home/orr/gpu-boot-report.txt 2>&1
