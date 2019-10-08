import os
import re
from subprocess import Popen, PIPE

color_regex   = r"\*(color\d+):\s*(#[a-fA-F\d]+)"
backgrd_regex = r"^\*background:\s*(?P<background>#[a-fA-F\d]+)"
foregrd_regex = r"^\*foreground:\s*(?P<foreground>#[a-fA-F\d]+)"

xcolors = {}
out,err = Popen(['xrdb', '-query'], stdout=PIPE).communicate()
out = out.decode('ISO-8859-1')

matches =  re.finditer(color_regex, out)
if matches:
    for match_num, match in enumerate(matches, start=1):
        xcolors.update({match.group(1) : match.group(2)})

match = re.match(backgrd_regex, out)
if match:
    xcolors.update({'background': match.group('background')})

match = re.match(foregrd_regex, out)
if match:
    xcolors.update({'foreground': match.group('foreground')})

print(xcolors)

colors = {
    'background': xcolors.get('background', '#191919'),
    'black'  : xcolors.get('color0', '#373b41'),
    'red'    : xcolors.get('color1', '#ff7b85'),
    'green'  : xcolors.get('color2', '#abdc88'),
    'yellow' : xcolors.get('color3', '#e5c07b'),
    'blue'   : xcolors.get('color4', '#63d1df'),
    'magenta': xcolors.get('color5', '#e48aff'),
    'cyan'   : xcolors.get('color6', '#61afef'),
    'white'  : xcolors.get('color7', '#c5c8c6')
}

font = {
    'face': 'Souce Code Pro',
    'size': 12
}

widgets = {
    'font': font['face'],
    'fontsize': font['size'],
    'padding': 3
}

wallpaper = os.path.expanduser('~/.config/qtile/wallpaper/wallpaper.png')
