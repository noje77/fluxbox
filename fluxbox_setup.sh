#!/usr/bin/env bash 
# script for install my custom version of fluxbox 


# make printscreen script exe style on /usr/local/bin, printscreen is imagemagick create home screenshot.png, open then on nomacs, then remove after close nomacs. 

prscr ()
{ 
echo "#!/bin/bash" >printscreen
#me=$(whoami)
echo "import ~/screenshot.png;nomacs ~/screenshot.png;rm ~/screenshot.png" >>printscreen
chmod 755 printscreen
sudo mv printscreen /usr/local/bin
}


# install skippy-xd 

skxd ()
{
7z x data/skippy-xd.7z
cd skippy-xd
sudo make install
cd ..
rm -rf skippy-xd
}



influxset ()
{
here=$(pwd)
rm -rf ~/.fluxbox/
cp -rf $here/data/fluxbox ~/.fluxbox
rm -rf ~/.config/tint2/
cp -rf $here/data/tint2  ~/.config/
rm -rf ~/.config/mate
cp -rf $here/data/mate ~/.config/
rm -rf ~/.config/dconf
cp -rf $here/data/dconf ~/.config/
rm -rf ~/.config/gtk-2.0
cp -rf $here/data/gtk-2.0 ~/.config/
rm -rf ~/.config/gtk-3.0
cp -rf $here/data/gtk-3.0 ~/.config/
rm -rf ~/.config/gtk-4.0
cp -rf $here/data/gtk-4.0 ~/.config/
rm -rf ~/.config/caja
cp -rf $here/data/caja ~/.config/
sudo cp $here/data/bin/* /usr/local/bin/
}

instsoft ()
{
sudo apt install xpad rofi tint2 rename mlocate csvtool xscreensaver xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod xscreensaver-screensaver-dizzy xscreensaver-screensaver-webcollage redshift redshift-gtk numlockx imagemagick conky conky-std nomacs recode curl html2text 
}


goocaml ()
{
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
mkdir ~/googldrive
}

instsoft
prscr
skxd
influxset
goocaml 
sudo 7z x data/fonts.7z -o/usr/share/fonts/truetype/
