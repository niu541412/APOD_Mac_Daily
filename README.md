# APOD Mac Daily

A script that works together to download the astronomy picture of the day (also know as [APOD](https://apod.nasa.gov/apod/)) and set it as the current desktop wallpaper in Mac OS X.

## HOW IT WORKS
The scripts work by requesting the APOD API, extracting the location of the HD version of the daily picture from that and downloading it. That downloaded picture will then be set as the wallpaper using osascript to every desktop and a notification will be sent. After the image file has been set as the current wallpaper it will be left in the ./tmp directory where you can keep if you like. This script will remove the outdated images several days later.

You can edit your crontab file to make this script to work automatically and periodically. For example

`#0 12 * * * /Users/username/Pictures/APOD_Mac_Daily/apod_daily.sh`

## REQUIREMENT
Mac OS

## KNOWN ISSUE
These scripts work by grabbing the link to the big version of an image, however sometimes the APOD people use flash videos or animated gifs instead of a bigger jpeg picture, these obviously don't work so the script doesn't even try to download these.
