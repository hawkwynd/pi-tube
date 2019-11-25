
# Omnitube for Raspberry PI


## Download NOObs for new PI install
https://www.raspberrypi.org/downloads/

## Installation process instructions for setup PI
https://www.raspberrypi.org/documentation/installation/noobs.md

## Configuration Process

Boot to the desktop and perform the following commands:

# install jq 
jq is used to parse json array of data for bash shell processing.

`sudo apt-get install jq`

# install youtube-dl
youtube-dl is the application which will download our video files from youtube.com and store
them in the video directory as .mp4 format files. 

`sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl`

Then, set the following:

`sudo chmod a+rx /usr/local/bin/youtube-dl`


## Configure the environment of your PI
We must set some environment variables in the PI:

This creates the environment file which Pi will load on login/boot:

`sudo vi /etc/environment` 

Enter the following information:

`PI_UID=OC_OMNITUBE_1` -- see below for important notes.

`URL=http://34.193.150.151/pi_callHome.php?id=`

Change `OC_OMNITUBE_1` to a unique identifier which you'll use in omniTube admin to register.
The PI_UID must exist in the mysql database and be assigned to a client record, which is in turn assigned to a campaign, and assigned to a customer. 

Save the file.


## Run the fetch.sh

From the pi-omnitube directory run:

`bash fetch.sh` 

and let it run. 

`^c to abort the process` -- you may have to hit it several times quickly. 




## The relationship Schema:
A customer can have many campaigns.

A campaign can have many clients.

A client can have many videos. 

## This README is a work in progress. Updates are coming.
