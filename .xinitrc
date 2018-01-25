DEFAULT_WM=i3
xrdb ~/.Xresources

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

