#! /usr/bin/perl -w
#
# apod.pl
#
# Original script by Harold Bakker
# http://www.haroldbakker.com/
#
# Modified by Ned W. Hummel, 6 Jan 2003, 12-01-2005
# Modified again by Harold Bakker, 12-01-2005
#
# Grabs the astronomy pictures of the day and put it on your OS X desktop.
#
# both this file and apod.pl should be in your PATH and executable
# (type this in the Terminal: cd ~/bin; chmod 755 apodosa.sh apod.pl;)
#

qx(cp /Users/jomic/Pictures/APOD-daily/apodosa.sh /tmp);

chdir "/tmp";

my $baseurl = "https://apod.nasa.gov/apod";
# Grab the line that has the link to the big picture.
qx(curl -O $baseurl/astropix.html);
my @line = grep m/href=\"image/i, qx(cat astropix.html);

# Grab the actual link to the image.
$_ = $line[0];
/"image\/([^\/]+)\/([^\/]+)\.([^\.]+)"/;
my $link = "$1/$2\.$3";
my $picture = $baseurl."/image/".$link;

print "Downloading $picture\n";

qx(curl -O $picture);

$myFile = "/tmp/$2.$3";
# change the desktop picture
print "Setting the new desktop picture\n";

qx(./apodosa.sh "$myFile");
# qx(rm $myFile);
qx(rm apodosa.sh astropix.html);
