import os
import re
import subprocess

color_regex   = re.compile(r"\*(color\d+):\s*(#[a-fA-F\d]+)")
backgrd_regex = re.compile(r"\*background:\s*(#[a-fA-F\d]+)")
foregrd_regex = re.compile(r"\*foreground:\s*(#[a-fA-F\d]+)")

out,err = Popen(['xrdb', '-query'], stdout=PIPE).communicate()

xcolors = {}
matches =  re.finditer(color_regex, out)
for match_num, match in enumerate(matches, start=1):
    xcolors.update({match.group(1) : match.group(2)})

color_val = re.search(backgrd_regex, out).group(1)
xcolors.update({'background': color_val})

color_val = re.search(foregrd_regex, out).group(1)
xcolors.update({'foreground': color_val})

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
