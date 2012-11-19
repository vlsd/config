#!/bin/bash
texfile="$2"
mupdf -r 120 "$1" &>/dev/null &
mupid="$!"
muwinid="0"
nummps=$(xdotool search --pid $mupid --class MuPDF | wc -l 2>/dev/null)
until [ $nummps -gt 0 ] ; do
    sleep 0.1
    nummps=$(xdotool search --pid $mupid --class MuPDF | wc -l 2>/dev/null)
done
echo -n "$(xdotool search --pid $mupid --class MuPDF | head -n1)" 

# send the mupdf window to the left monitor
# and the gvim window to the right monitor. then maximize them both
wmctrl -r "$1" -e 0,0,0,1020,720 
wmctrl -r "$1" -b add,maximized_horz
wmctrl -r "$1" -b add,maximized_vert
wmctrl -a "$1"
wmctrl -r "$2" -e 0,1024,36,1280,970 
wmctrl -r "$2" -b add,maximized_horz
wmctrl -r "$2" -b add,maximized_vert
wmctrl -a "$2"

# try to return focus to GVIM
#xdotool search --class --name "${texfile}.*GVIM" windowactivate &>/dev/null
exit 0
