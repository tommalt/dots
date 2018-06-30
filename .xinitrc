DEFAULT_WM=i3

case $wm in
i3)
	exec i3
	;;
dwm)
	exec dwm
	;;
*)
	exec $DEFAULT_WM
	;;
esac

