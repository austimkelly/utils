#!/bin/sh

# create_launcher_app_icons.sh
#
# Created by Tim Kelly, 2014-2015
#
# Prerequisites: You must have ImageMagick installed on the command-line.
#
# Usage: $sh create_launcher_app_icons.sh <input image>
#
# Where <input image> should be square and at least 1024x1024 or larger PNG file.
#

INPUT_IMAGE=$1

OUTPUT_DIR=./out_icons

echo Converting with INPUT_IMAGE=$INPUT_IMAGE and output directory to $OUTPUT_DIR

# test if ImageMagick is installed
if [ ! type "convert" > /dev/null ]; then
    echo ERROR: ImageMagick not intalled. Cannot find convert tool on this system
    print_usage
    exit 1
else
    echo Found ImageMagic convert tool installed:
    convert -version
fi

# test if input image exists
if [ ! -e $INPUT_IMAGE ]; then
    echo ERROR: cannot find $INPUT_IMAGE
    print_usage
    exit 1
fi

rm -rf $OUTPUT_DIR

IPHONE_OUT_DIR=$OUTPUT_DIR/iPhone/Images.xcassets/AppIcon.appiconset
IPAD_OUT_DIR=$OUTPUT_DIR/iPad/Images.xcassets/AppIcon.appiconset

mkdir -p $IPHONE_OUT_DIR
mkdir -p $IPAD_OUT_DIR
mkdir -p $OUTPUT_DIR/iPhone/iTunesArtwork
mkdir -p $OUTPUT_DIR/iPad/iTunesArtwork

# do the app icon conversion
#iOS App Icons - These are based on XCode 6.1 App Icon sizes for iOS 6.1 and greater.
echo ==== Creating iPhone Icons ====
#convert $INPUT_IMAGE -resize 40x40 $IPHONE_OUT_DIR/Icon-40.png
convert $INPUT_IMAGE -resize 120x120 $IPHONE_OUT_DIR/iPhone-Icon-60@2x.png
convert $INPUT_IMAGE -resize 180x180 $IPHONE_OUT_DIR/iPhone-Icon-60@3x.png
convert $INPUT_IMAGE -resize 80x80 $IPHONE_OUT_DIR/iPhone-Icon-40@2x.png
convert $INPUT_IMAGE -resize 120x120 $IPHONE_OUT_DIR/iPhone-Icon-40@3x.png
convert $INPUT_IMAGE -resize 57x57 $IPHONE_OUT_DIR/iPhone-Icon-57.png
convert $INPUT_IMAGE -resize 114x114 $IPHONE_OUT_DIR/iPhone-Icon-57@2x.png
convert $INPUT_IMAGE -resize 29x29 $IPHONE_OUT_DIR/iPhone-Icon-29.png
convert $INPUT_IMAGE -resize 58x58 $IPHONE_OUT_DIR/iPhone-Icon-29@2x.png
convert $INPUT_IMAGE -resize 87x87 $IPHONE_OUT_DIR/iPhone-Icon-29@3x.png

convert $INPUT_IMAGE -resize 1024x1024 $OUTPUT_DIR/iPhone/iTunesArtwork/iTunesArtwork@2x
convert $INPUT_IMAGE -resize 512x512 $OUTPUT_DIR/iPhone/iTunesArtwork/iTunesArtwork

# iPad App Icons
echo ==== Creating iPad Icons ====

convert $INPUT_IMAGE -resize 1024x1024 $OUTPUT_DIR/iPad/iTunesArtwork/iTunesArtwork@2x
convert $INPUT_IMAGE -resize 512x512 $OUTPUT_DIR/iPad/iTunesArtwork/iTunesArtwork

convert $INPUT_IMAGE -resize 29x29 $IPAD_OUT_DIR/iPad-Icon-29.png
convert $INPUT_IMAGE -resize 58x58 $IPAD_OUT_DIR/iPad-Icon-29@2x.png
convert $INPUT_IMAGE -resize 40x40 $IPAD_OUT_DIR/iPad-Icon-40.png
convert $INPUT_IMAGE -resize 80x80 $IPAD_OUT_DIR/iPad-Icon-40@2x.png
convert $INPUT_IMAGE -resize 50x50 $IPAD_OUT_DIR/iPad-Icon-50.png
convert $INPUT_IMAGE -resize 100x100 $IPAD_OUT_DIR/iPad-Icon-50@2x.png
convert $INPUT_IMAGE -resize 72x72 $IPAD_OUT_DIR/iPad-Icon-72.png
convert $INPUT_IMAGE -resize 144x144 $IPAD_OUT_DIR/iPad-Icon-72@2x.png
convert $INPUT_IMAGE -resize 76x76 $IPAD_OUT_DIR/iPad-Icon-76.png
convert $INPUT_IMAGE -resize 152x152 $IPAD_OUT_DIR/iPad-Icon-76@2x.png

# Android App Icons
echo ==== Creating Android Icons ====
mkdir -p $OUTPUT_DIR/Android/res/drawable-xxhdpi
mkdir -p $OUTPUT_DIR/Android/res/drawable-xhdpi
mkdir -p $OUTPUT_DIR/Android/res/drawable-mdpi

convert $INPUT_IMAGE -resize 144x144 $OUTPUT_DIR/Android/res/drawable-xxhdpi/ic_launcher.png
convert $INPUT_IMAGE -resize 96x96 $OUTPUT_DIR/Android/res/drawable-xhdpi/ic_launcher.png
convert $INPUT_IMAGE -resize 48x48 $OUTPUT_DIR/Android/res/drawable-mdpi/ic_launcher.png