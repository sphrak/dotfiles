[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap se
exec i3
