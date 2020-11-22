#!/bin/bash

sleep 3 #time (in s) for the DE to start; use ~20 for Gnome or KDE, less for Xfce/LXDE etc // JNO_Back by default at 10.
exec conky -c /home/enki/.fluxbox/conky/round/rings & # the main conky with rings
sleep 1 #time for the main conky to start; needed so that the smaller ones draw above not below (probably can be lower, but we still have to wait 5s for the rings to avoid segfaults)
exec conky -c /home/enki/.fluxbox/conky/round/cpu &
sleep 1
exec conky -c /home/enki/.fluxbox/conky/round/mem &
#conky -c ~/.Conky/notes &

## descente du 1er sleep à 3 au lieu de 4
