​# Apod_Mac_Daily
Forked from [Harold's](http://www.haroldbakker.com/personal/apod.php) Scripts.

Two scripts that work together to download the astronomy picture of the day (also know as [APOD](https://apod.nasa.gov/apod/)) and set it as the current desktop backgrond in Mac OS X.

HOW IT WORKS
The scripts work by downloading an HTML file, extracting the location of the big version of the daily picture from that and downloading that. That downloaded picture will then be set as the current desktop background using OSAscript, a commandline version of Applescript. After the image file has been set as the current desktop background it will be left in the /tmp directory where you can fish it out for safekeeping if you like.

REQUIRES
Mac OS X
Perl and curl (should be installed already otherwise install the developerstools)


KNOWN ISSUE
These scripts work by grabbing the link to the big version of an image, however sometimes the APOD people use flash videos or animated gifs instead of a bigger jpeg picture, these obviously don't work so the script doesn't even try to download these, you'll be forced to look at the picture that was already on your desktop.

 Updated by me
 1. Set back to random wallpapers provided by Mac OS.
 2. Send notification when it updates the wallpaper with the name and authors.

