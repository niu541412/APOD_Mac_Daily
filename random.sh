#!/bin/sh
/usr/bin/osascript <<END
tell application "System Events"
 tell current desktop
 set picture rotation to 1 -- 0=off | 1=interval | 2=login | 3=sleep
 set random order to true
 set pictures folder to "/Library/Desktop Pictures"
 set change interval to 3600 -- seconds
 end tell
end tell
END
