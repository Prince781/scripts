###################################################
## MINECRAFT INSTALLATION SCRIPT BELOW...
###################################################
if [ $UID -ne 0 ]; then
	echo "You must be the root user in order to run this."
	exit 1
fi
#installation of core Java packages...
yum -y install java-1.7.0-openjdk
#for the icons...
#ICON512=icons/512/minecraft.png
ICON256=lib/mcrft_icons/256/minecraft.png
ICON128=lib/mcrft_icons/128/minecraft.png
ICON64=lib/mcrft_icons/64/minecraft.png
ICON48=lib/mcrft_icons/48/minecraft.png
ICON32=lib/mcrft_icons/32/minecraft.png
ICON16=lib/mcrft_icons/16/minecraft.png

if [ -e "/usr/share/icons/hicolor/256x256/apps/minecraft.png" ]; then
	rm /usr/share/icons/hicolor/256x256/apps/minecraft.png
fi
if [ -e "/usr/share/icons/hicolor/128x128/apps/minecraft.png" ]; then
	rm /usr/share/icons/hicolor/128x128/apps/minecraft.png
fi
if [ -e "/usr/share/icons/hicolor/64x64/apps/minecraft.png" ]; then
	rm /usr/share/icons/hicolor/64x64/apps/minecraft.png
fi
if [ -e "/usr/share/icons/hicolor/48x48/apps/minecraft.png" ]; then
	rm /usr/share/icons/hicolor/48x48/apps/minecraft.png
fi
if [ -e "/usr/share/icons/hicolor/32x32/apps/minecraft.png" ]; then
	rm /usr/share/icons/hicolor/32x32/apps/minecraft.png
fi
if [ -e "/usr/share/icons/hicolor/16x16/apps/minecraft.png" ]; then
	rm /usr/share/icons/hicolor/16x16/apps/minecraft.png
fi

#cp $ICON512 /usr/share/icons/hicolor/512x512/apps/minecraft.png
cp $ICON256 /usr/share/icons/hicolor/256x256/apps/minecraft.png
cp $ICON128 /usr/share/icons/hicolor/128x128/apps/minecraft.png
cp $ICON64 /usr/share/icons/hicolor/64x64/apps/minecraft.png
cp $ICON48 /usr/share/icons/hicolor/48x48/apps/minecraft.png
cp $ICON32 /usr/share/icons/hicolor/32x32/apps/minecraft.png
cp $ICON16 /usr/share/icons/hicolor/16x16/apps/minecraft.png

DESKTOP=/usr/share/applications/minecraft.desktop
INSTALL=/usr/local/minecraft
MINECRAFT='http://www.minecraft.net/download/minecraft.jar'

mkdir $INSTALL
cd $INSTALL
wget $MINECRAFT

if [ -e "$DESKTOP" ]; then
	rm $DESKTOP
fi

touch $DESKTOP
echo '[Desktop Entry]' >> $DESKTOP
echo 'Name=Minecraft' >> $DESKTOP
echo 'Exec=minecraft' >> $DESKTOP
echo 'Icon=minecraft' >> $DESKTOP
echo 'Terminal=false' >> $DESKTOP
echo 'Categories=Game;' >> $DESKTOP
echo 'Type=Application' >> $DESKTOP

if [ -d "/usr/lib/jvm/jre-1.7.0-openjdk.x86_64/lib/amd64" ]; then
	echo "export LD_LIBRARY_PATH=\"/usr/lib/jvm/jre-1.7.0-openjdk.x86_64/lib/amd64\"" >> /usr/bin/minecraft
fi
echo "java -Xmx1024M -Xms512M -cp $INSTALL/minecraft.jar net.minecraft.LauncherFrame" >> /usr/bin/minecraft
chmod a+x /usr/bin/minecraft
