#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar black >>/tmp/polybar1.log 2>&1 & disown
polybar example -r >>/tmp/polybar1.log 2>&1 & disown
echo "Bars launched..."

# [module/updates]
# type = custom/script
# exec = doas xbps-install -S > /dev/null 2>&1; xbps-updates
# format = <label>
# interval = 4600 
# label =  %output%  
# label-padding = 2
# label-foreground = #BF616A
