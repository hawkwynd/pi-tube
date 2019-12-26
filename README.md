
# Omnitube for Raspberry PI 
December 2019 -- Scott Fleming scott@omnicommander.com

## Download NOObs for new PI Raspian
https://www.raspberrypi.org/downloads/

## Installation process instructions for Raspian OS Installation
https://www.raspberrypi.org/documentation/installation/noobs.md


## Clone script from repo ( this ) 

Change to pi's home directory

`cd ~` 

Clone this code

`git clone https://github.com/omnicommander/pi-tube`

## Run Omnitube install script (must be sudo)
`cd /home/pi/pi-tube`

`sudo ./install`

During the install, you will be prompted to enter the machine's ID. Be SURE you have it written down, so that you know it matches the one your customer has in TubeCommander. 

### The install script makes the following changes to the internal files within the Raspberry OS:

* self-update, `apt-get upgrade -y`
* install jq `apt-get install jq`
* install youtube-dl 

### Configures vlc to be run as sudo 
`sed -i 's/geteuid/getppid/' /usr/bin/vlc`

### extract /home/pi/pi-tar/config.tar to respective directories
* `home/pi/.config/lxsession/LXDE-pi/autostart`
* `home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf`
* `home/pi/.config/lxpanel/LXDE-pi/config`

### extract /home/pi/pi-tube/booter.tar
* `etc/lightdm/lightdm.conf`
* `etc/rc.local`
* `boot/cmdline.txt`

### Edit /home/pi/pi-tube/config.sh for PI_UID
* User enters the client Id configured in TubeCommander for customer campaign.


# Code Logic PSUEDO:
* Cron job runs as sudo runs `/home/pi/pi-tube/fetch`
 
 Fetch peforms the following:

 1. Build inventory of existing videos
 2. Request payload from server and build array of videos in campaign
 3. Compares existing inventory to array of response videos 
 4. Downloads videos not in inventory to /videos directory
 5. Deletes videos from inventory not in response videos
 6. Stops vlc service ( if currently running )
 7. Restarts vlc as service to loop videos
 8. Exits gracefully until next cron call.

 ## Sample fetch.log entry
 fetch records to a logfile, for troubleshooting. 

 ```
 2019-12-26 15:45:01 Running Fetch Application - v1.3 by Scott Fleming
2019-12-26 15:45:01 Current inventory IDs: uzQ9kxs6RL8 M69uwmXb6GM X675jPEP9Fw 68cGgU2pSE0 dGStpJuIReM
2019-12-26 15:45:01 IDs from host: uzQ9kxs6RL8 M69uwmXb6GM X675jPEP9Fw 68cGgU2pSE0 dGStpJuIReM
2019-12-26 15:45:01 Found differences: 
2019-12-26 15:45:01 count of inventory: 0 1 2 3 4
2019-12-26 15:45:01 Starting at 6
2019-12-26 15:45:01 killing VLC
2019-12-26 15:45:01 run vlc
2019-12-26 15:45:01 Running cvlc /home/pi/pi-tube/video OmniTube
```

## TODO - 12/26/19
* Push function to send logfile back to server for capture.
* Realtime capture of CPU utilization, RAM and temperature.
* Error trapping functions so fallible items can be dealt with. 

