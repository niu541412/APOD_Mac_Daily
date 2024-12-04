# APOD Mac Daily

A script that works together to download the astronomy picture of the day (also known as [APOD](https://apod.nasa.gov/apod/)) and set it as the current desktop wallpaper in MacOS.

## HOW IT WORKS
`chmod +x *sh`

The scripts work by requesting the APOD API, extracting the location of the HD version of the daily picture from that, and downloading it. That downloaded picture will then be set as the wallpaper using osascript on every desktop and a notification will be sent. After the image file has been set as the current wallpaper it will be left in the ./tmp directory (or specify a parameter that points to a directory) where you can keep it if you like. This script will remove the outdated images several days later.

You can edit your crontab file  (`crontab -e` in the terminal) to make this script work automatically and periodically. For example

```cron
0 12 * * * /Users/username/Pictures/APOD_Mac_Daily/apod_daily.sh
```

**NOTE**: Due to prermission issue, you may need to grant cron to accesss full disk in System Preferences as this [guide](https://apple.stackexchange.com/questions/402132?#answer-402179).

## REQUIREMENT
MacOS

## KNOWN ISSUE
These scripts work by grabbing the link to the big version of an image, however sometimes the APOD people use flash videos or animated GIFs instead of a bigger JPEG picture, these obviously don't work so the script doesn't even try to download these.
