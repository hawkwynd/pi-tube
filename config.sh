#!/usr/bin/env bash

TITLE="Greystone Omnitube"                          # displays on lower right corner (empty for blank)
LOGOPATH="/home/pi/pi-tube/img/logo.png"            # omnicommander logo image (empty for blank or none)
JSONPATH="/home/pi/pi-tube/json"          	        # path for json file from server.
VIDEOPATH="/home/pi/pi-tube/video"                  # path for fetch to store video mp4 files
fetchLog="/home/pi/pi-tube/fetch.log"               # path for logging 
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`               # timestamp formatting for logger
URL="http://34.193.150.151/pi_callHome.php?id="     # url to server for requests
AUTHOR="Scott Fleming scott@omnicommander.com"      # author
PI_UID="OC_OMNITUBE_GREYSTONE"                      # ID for this PI machine
VERSION=1.2                                         # revision number