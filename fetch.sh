#!/bin/sh

# OmniTube v1.0 -- Scott Fleming
# scott@omnicommander.com
# PI_UID and URL are set as global variables in /etc/environment
# ===============================================================
# URL       = server api
# PI_UID    = Unique identifier of PI machine making request.
#----------------------------------------------------------------

# Fetch json array of youtubeID's passed with serverID 
echo "query: ${URL}${PI_UID}"

# curl -s -H "Content-Type: application/json" -X GET https://www.hawkwynd.com/ot/?id=1001 -o json/file.json
curl -s -H "Content-Type: application/json" -X GET "${URL}${PI_UID}" -o json/file.json

# use jq to parse array of json and load into arr
arr=( $(jq -r '.[].youtube_id' json/file.json) )

echo "${#arr[@]} assets to download."
echo "clearing ./video directory"
rm ./video/*


# for i in "${!arr[@]}"; do 
#   printf "%s\t%s\n" "$i" "${arr[$i]}"
# done

# iterate arr and issue youtube-dl command for the id
for i in "${!arr[@]}"
do
    echo "saving .video/${i}_${PI_UID}_${arr[$i]}.mp4"
     
     #youtube-dl --quiet --no-warnings --config-location /home/pi/.config/youtube-dl-video.conf https://www.youtube.com/watch?v=$i
     youtube-dl --format mp4 --quiet --no-warnings --ignore-errors --ignore-config  --prefer-ffmpeg https://www.youtube.com/watch?v=${arr[$i]} -o "./video/${i}_${PI_UID}_${arr[$i]}.mp4"

done

# Run the looper script
bash looper.sh
