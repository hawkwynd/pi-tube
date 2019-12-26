
# Omnitube for Raspberry PI 
December 2019 -- Scott Fleming scott@omnicommander.com

## Download NOObs for new PI Raspian
https://www.raspberrypi.org/downloads/

## Installation process instructions for Raspian OS Installation
https://www.raspberrypi.org/documentation/installation/noobs.md


## Run Omnitube install script
`cd /home/pi/pi-tube`

# run install script
`./install`

During install, you will be prompted to enter the machine's ID. Be SURE you have it written down, so that you know it matches the one your customer has in TubeCommander. 

The install script makes changes to the internal files within the Raspberry OS:

* self-update, `apt-get upgrade -y`
* install jq `apt-get install jq`
* install youtube-dl 

### extract config.tar to respective directories
* `home/pi/.config/lxsession/LXDE-pi/autostart`
* `home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf`
* `home/pi/.config/lxpanel/LXDE-pi/config`


