DEFAULT_WM=i3

case $wm in
i3)
	exec i3
	;;
xfce)
	exec startxfce4
	;;
dwm)
	exec dwm
	;;
*)
	exec $DEFAULT_WM
	;;
esac

