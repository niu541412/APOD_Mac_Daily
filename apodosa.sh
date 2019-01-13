#!/bin/sh

#
# supporting file for apod.pl
# both this file and apod.pl should be in your PATH
# and executable (type this in the Terminal: cd ~/bin; chmod 755 apodosa.sh apod.pl)
#
# made by Harold Bakker, harold@haroldbakker.com
# http://www.haroldbakker.com/
# modified by Jomic, 2016/09/22

pic_title=$(cat /tmp/astropix.html|grep -B 2 'Credit')
pic_title=${pic_title/ <\/b>*/}
pic_title=${pic_title/*<b> /}

pic_author=$(cat /tmp/astropix.html|grep -A20 'Credit.*'|grep -B 20 '</center>')
pic_author=$(echo "$pic_author"|sed -e '/Credit/d' -e '/center/d' -e'/<i>/,$d')
pic_author=$(echo $pic_author|sed -e "s/; <b>.*>//g" -e "s/<a[^>]*>//g" -e "s/<\/a>//g")

#new fix 2016/12/23
pic_author=$(echo $pic_author|sed -e "s/^.*: <\/b>//g")

#convert html symbol to ascii
pic_author=$(echo $pic_author|recode HTML)

/usr/bin/osascript <<END
tell application "System Events" --added by jomic
 tell current desktop
  set picture rotation to 0
 end tell
end tell

tell application "Finder"
 set pFile to POSIX file "$1" as string
 set desktop picture to file pFile
end tell

display notification "$pic_author" with title "Astronomy Picture of the Day" subtitle "$pic_title" sound name "Glass"

END
