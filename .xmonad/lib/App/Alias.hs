-- |

module App.Alias where

panel :: String
panel = "~/.config/polybar/launch.sh"

wallpaper :: String
wallpaper = "~/.fehbg"

compositor :: String
compositor = "compton &"

notifications :: String
notifications = "dunst"

xresource :: String
xresource = "[[ -f ~/.Xresources ]] && nohup xrdb -merge -I$HOME ~/.Xresoruces > /dev/null"

tty :: String
tty = "urxvt"

scratch :: String
scratch = "kitty --name=scratchpad"

music :: String
music = "spotify"

code :: String
code = "code"

browser :: String
browser = "firefox"
