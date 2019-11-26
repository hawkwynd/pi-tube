#!/bin/sh
#=================================================================
# OmniTube v1.0 -- Scott Fleming
# scott@omnicommander.com
#=================================================================

# create our directories if they are not already created
mkdir -p ./video
mkdir -p ./json


# Fetch json array of youtubeID's passed with serverID 
echo "Executing Query: ${URL}${PI_UID}"

# cURL request, save to json/file.json 
curl -s -H "Content-Type: application/json" -X GET "${URL}${PI_UID}" -o json/file.json

# use jq to parse array of json and load into arr
arr=( $(jq -r '.[].youtube_id' json/file.json) )

echo "${PI_UID} currently has ${#arr[@]} asset files to download."
#echo "Flushing video directory..."

rm -f ./video/*

# iterate array and issue youtube-dl command for the id
for i in "${!arr[@]}"
do
    echo 
    echo "executing youtube-dl: ${i}_${PI_UID}_${arr[$i]}.mp4..."
     
     youtube-dl --format mp4 --no-warnings --ignore-errors --ignore-config  --prefer-ffmpeg https://www.youtube.com/watch?v=${arr[$i]} -o "./video/${i}_${PI_UID}_${arr[$i]}.mp4"

done

# Run the looper script
#  bash looper.sh

