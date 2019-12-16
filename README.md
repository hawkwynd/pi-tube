
# Omnitube for Raspberry PI 
December 2019 -- Scott Fleming scott@omnicommander.com

## Download NOObs for new PI install
https://www.raspberrypi.org/downloads/

## Installation process instructions for setup PI
https://www.raspberrypi.org/documentation/installation/noobs.md

# Configuration Process after first boot

Once your Pi has booted, open a command line window and run a shitload of commands.

## Update all modules, and bring update Pi's base

`sudo apt-get update`

`sudo apt-get dist-upgrade -y`

## Install jq REQUIRED
jq is used to parse json array of data for bash shell processing

`sudo apt-get install jq`

## Install youtube-dl REQUIRED

youtube-dl is the application which will download our video files from youtube.com and store
them in the video directory as .mp4 format files. REQUIRED

`sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl`

Then, set the following:

`sudo chmod a+rx /usr/local/bin/youtube-dl`

## Run VLC as sudo REQUIRED
Next allow vlc to be run as sudo -- by default VLC complains like a dirty whore when we run it as sudo, 
so we have to slap that bitch about to convince her to play nice and run as sudo.

`sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc`

# Desktop appearance settings
Here we need to get our local configuration set up. 




## Disable the menu taskbar

`nano ~/.config/lxsession/LXDE-pi/autostart`

Comment out the first line of this file. If it doesn't exist, create the directories, and autostart file

```
#@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
@xscreensaver -no-splash
```


## Disable the cursor on desktop 

`sudo vi /etc/lightdm/lightdm.conf`

Uncomment the line and set xserver-command -nocursor

`xserver-command=X -nocursor`


# Setting the desktop background
copy default to our config dir

`cp /etc/xdg/pcmanfm/LXDE-pi/autostart /home/pi/pi-tube/.config/pcmanfm/LXDE-pi/autostart`

Edit the configuration then set wallpaper=path/to/your/wallpaper/filename.ext (jpg or png)

`nano ~/.config/pcmanfm/LXDE-pi/autostart`

```
wallpaper_mode=crop
wallpaper_common=1
# wallpaper=/usr/share/rpd-wallpaper/temple.jpg
wallpaer=/home/pi/background.png
desktop_bg=#000000000000
desktop_fg=#e8e8e8e8e8e8
desktop_shadow=#d6d6d3d3dede
desktop_font=PibotoLt 12
show_wm_menu=0
sort=mtime;ascending;
show_documents=0
# show_trash=1
show_trash=0
show_mounts=1
```
