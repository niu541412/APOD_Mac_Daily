#!/bin/bash
screen_num=$(osascript -e "tell application \"System Events\" to return count of desktops")
today_is_video=false
random_apod=false

if [ ! -d "tmp" ];then
mkdir tmp
fi

apodjson=$(curl -X GET "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
date=$(echo $apodjson|json_pp|grep date|awk -F '"' '{print $4}')
explanation=$(echo $apodjson|json_pp|grep explanation|awk -F '"' '{print $4}')
title=$(echo $apodjson|json_pp|grep title|awk -F '"' '{print $4}')
media_type=$(echo $apodjson|json_pp|grep media_type|awk -F '"' '{print $4}')
hdurl=$(echo $apodjson|json_pp|grep hdurl|awk -F '"' '{print $4}')
url=$(echo $apodjson|json_pp|grep -w url|awk -F '"' '{print $4}')
apod_date=${date}
epoch=$(date -j -f "%Y-%m-%d" $apod_date +%s)

#try to set wallpaper to every screen, if some images are missing, set to the same apod as today.
if [ $media_type == "video" ]; then
   #echo "Today is a video, will try to capture a video snapshot."
   echo "Today is a video, please visit $url for more information."
   osascript -e "display notification \"Astronomy Picture of the Day\" with title \"Today is a video, please visit\" subtitle \"$url\" sound name \"Glass\""
   today_is_video=true
elif [ $media_type == "image" ]; then
  curl -o tmp/apod_${date}.jpg ${hdurl}
  echo "Today is a image, change the wallpaper."
  for ((i=1; i<=${screen_num}; i++))
  do
    date=$(date -r $(($epoch - (i-1)*86400)) +"%Y-%m-%d")
    if [ ! -f "$PWD/tmp/apod_${date}.jpg" ];then
    date=$apod_date
    fi
    echo "apod_${date}"
    osascript -e "tell application \"System Events\"" -e "tell desktop ${i}" -e "set picture rotation to 0" -e "set picture to \"$PWD/tmp/apod_${date}.jpg\"" -e "end tell" -e "end tell"
  done
  osascript -e "display notification \"Astronomy Picture of the Day\" with title \"$title\" subtitle \"$explanation\" sound name \"Glass\""
else
  echo "Error! Today APOD is something werid."
  #do somthing
fi

#clean outdated images
find $PWD/tmp -mtime +$(($screen_num+3)) -exec rm {} \;
