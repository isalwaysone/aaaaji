#!/bin/bash

ffmpeg -i $1 -vf fps=15,scale=320:-1:flags=lanczos,palettegen /tmp/gif_palette.png
ffmpeg -i $1 -i /tmp/gif_palette.png -filter_complex "fps=15,scale=400:-1:flags=lanczos[x];[x][1:v]paletteuse" $2
rm /tmp/gif_palette.png
