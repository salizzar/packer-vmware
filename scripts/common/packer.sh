#
# Packer download and install.
#

curl -ks https://www.packer.io/downloads.html

echo "XALALA: [$(curl -ks https://www.packer.io/downloads.html | grep 'Latest version' | egrep -o '[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}')]"

PACKER_VER=$(curl -ks https://www.packer.io/downloads.html | grep "Latest version" | egrep -o "[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}")
PACKER_PKG="packer_${PACKER_VER}_linux_amd64.zip"
PACKER_URL="https://dl.bintray.com/mitchellh/packer/$PACKER_PKG"
PACKER_TMP="/tmp/$PACKER_PKG"
PACKER_DIR="/usr/local/bin"

curl --location --output $PACKER_TMP $PACKER_URL

unzip -v -o $PACKER_TMP -d $PACKER_DIR

