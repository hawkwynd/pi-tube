
# Omnitube for Raspberry PI

## Download NOObs for new PI install
https://www.raspberrypi.org/downloads/

## Installation process instructions for setup PI
https://www.raspberrypi.org/documentation/installation/noobs.md

## Configuration Process

Once your Pi has booted.
Open a command line window and run the following commands:

# Update all modules, and bring update Pi's base

`sudo apt-get update`

`sudo apt-get dist-upgrade -y`

# Install jq 
jq is used to parse json array of data for bash shell processing. `REQUIRED`

`sudo apt-get install jq`

# Install youtube-dl

youtube-dl is the application which will download our video files from youtube.com and store
them in the video directory as .mp4 format files. REQUIRED

`sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl`

Then, set the following:

`sudo chmod a+rx /usr/local/bin/youtube-dl`

# Run VLC as SUDO
Next allow vlc to be run as sudo -- by default VLC complains like a dirty whore when we run it as sudo, 
so we have to slap that bitch about to convince her to play nice and run as sudo.

`sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc`

# Desktop appearance settings

## Disable the menu taskbar

`nano ~/.config/lxsession/LXDE-pi/autostart`

`#@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
@xscreensaver -no-splash`
