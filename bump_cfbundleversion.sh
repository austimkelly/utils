#!/bin/sh

# bump_cfbundleversion.sh
#
# Created by Tim Kelly, 2014-2015
#
# Summary: This file takes an input of a .plist file that contains a "Bunle Version"
# This script will get the number of git commits and make that the revision.
# It then takes the display version from the project and adds on the git rev count and updates the .plist file.
#
#
# Prerequisites: XCode 6.1 and valid project -Info.plist file and your project in a git repository.
#
# Usage: $sh bump_cfbundleversion.sh <path to <Project>-Info.plist with CFBundleIdentifier
#
#


INFOPLIST_PATH=$1

if [ ! -f $INFOLIST_PATH ]; then
    echo "$INFOLIST_PATH file not found!"
    exit 1
fi

# The argvtool gets the version from the CURRENT_PROJECT_VERSION value
# Under your projects Build Settings, make sure you have "Current Project Version" value set.
CURVERSION=`agvtool vers -terse`
echo "current version $CURVERSION"

# get the number of git commits
REV=$(git rev-list HEAD --count)
echo REV=$REV

# set the current app version in the Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $CURVERSION.$REV" "${INFOPLIST_PATH}"

CURVERSION=`agvtool vers -terse`
echo "current version $CURVERSION"
