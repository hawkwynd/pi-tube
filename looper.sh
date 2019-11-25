#!/bin/sh

# OmniTube v1.0 -- Scott Fleming
# scott@omnicommander.com
# ================================================================

# get rid of the cursor so we don't see it when videos are running
#setterm -cursor off

# set here the path to the directory containing your videos
VIDEOPATH="video" 

# you can normally leave this alone
SERVICE="cvlc"

t="OmniTube v1.0"

# now for our infinite loop!
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
                sleep 5;
	else
        
        # VLC option parameters
        # ================================================================
        # -Z : Look in the $VIDEOPATH directory and play all files
        # -L : Loop the list of files 
        # -f : play video full screen always
	# -q : quiet - disable errors, warnings etc.
        # --no-video-title-show : Do not display the video title
        # --no-random : Play in the order they are listed in the directory
	# --no-audio : Do not play audio
        # =================================================================
        # sub-source parameters: 
        # position: {0 (Center), 1 (Left), 2 (Right), 4 (Top), 8 (Bottom), 5 (Top-Left), 6 (Top-Right), 9 (Bottom-Left), 10 (Bottom-Right)} 
        # x: horizontal spacing y: vertical spacing
        # color: 0xhex-value color HTML #000000 = black, #FF0000 = red, #00FF00 = green, #FFFF00 = yellow (red + green), #FFFFFF = white
        # opacity: 0=transparent 255=opaque (default)

     	cvlc -ZfLq $VIDEOPATH --ignore-config --no-audio --no-random --no-video-title-show --sub-source="marq{marquee=$t %a %b %d %Y %l:%M:%S %P,color=0xFFFFFF,position=10,size=16,x=20,y=10}:logo{file=img/logo.png, position=6,x=10,opacity=100}"

	fi
done
