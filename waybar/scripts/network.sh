#!/bin/bash

STATE_FILE="/tmp/waybar_network_mode"

# Toggle mode on click
if [ "$1" = "toggle" ]; then
    MODE=$(cat "$STATE_FILE" 2>/dev/null || echo "speed")
    [ "$MODE" = "speed" ] && echo "ip" > "$STATE_FILE" || echo "speed" > "$STATE_FILE"
    exit
fi

MODE=$(cat "$STATE_FILE" 2>/dev/null || echo "speed")

# Get active network interface
IFACE=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5; exit}')

if [ -z "$IFACE" ]; then
    echo '{"text": "󰤭 offline", "tooltip": "No connection", "class": "disconnected"}'
    exit
fi

# Sample bandwidth over 1 second
RX1=$(awk -v iface="$IFACE:" '$1==iface {print $2}' /proc/net/dev)
TX1=$(awk -v iface="$IFACE:" '$1==iface {print $10}' /proc/net/dev)
sleep 1
RX2=$(awk -v iface="$IFACE:" '$1==iface {print $2}' /proc/net/dev)
TX2=$(awk -v iface="$IFACE:" '$1==iface {print $10}' /proc/net/dev)

RX_BYTES=$(( RX2 - RX1 ))
TX_BYTES=$(( TX2 - TX1 ))

# Format speed
format_speed() {
    local bytes=$1
    if [ $bytes -ge 1048576 ]; then
        echo "$(awk "BEGIN {printf \"%.1f\", $bytes/1048576}")MB/s"
    elif [ $bytes -ge 1024 ]; then
        echo "$(awk "BEGIN {printf \"%.0f\", $bytes/1024}")KB/s"
    else
        echo "${bytes}B/s"
    fi
}

DOWN=$(format_speed $RX_BYTES)
UP=$(format_speed $TX_BYTES)

# Today's usage via vnstat
VNSTAT=$(vnstat --oneline 2>/dev/null | awk -F';' '{print "  ↓  "$10"    ↑  "$11}')
[ -z "$VNSTAT" ] && VNSTAT="vnstat not ready yet"

# Top app by most active TCP connections
TOP=$(ss -tnp 2>/dev/null \
    | awk 'NR>1 && $NF~/pid/ {
        match($NF, /pid=([0-9]+)/, a)
        print a[1]
    }' \
    | sort | uniq -c | sort -rn \
    | head -1 \
    | awk '{print $2}' \
    | xargs -I{} cat /proc/{}/comm 2>/dev/null)
[ -z "$TOP" ] && TOP="idle"

# Icon based on interface type
if [[ "$IFACE" == w* ]]; then
    ICON="󰤨"
else
    ICON="󰊗"
fi

# Display mode
if [ "$MODE" = "ip" ]; then
    IP=$(ip addr show "$IFACE" | awk '/inet / {print $2}' | head -1)
    TEXT="$ICON $IP"
else
    TEXT="$ICON ${DOWN} ↓ ${UP} ↑"
fi

TOOLTIP="Interface: $IFACE\nToday's usage: $VNSTAT\nTop app: $TOP"

echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TOOLTIP\"}"