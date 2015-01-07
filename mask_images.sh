#!/bin/sh

# mask_images.sh
#
# Created by Tim Kelly, 2014-2015
#
# Prerequisites: You must have ImageMagick installed on the command-line.
#
# Usage: $sh mask_images.sh <hex color> <input dir> <output dir>
#
# Where:
#   <hex color> is a six character color value
#   <input dir> a directory containing .png files. Non-recursive.
#   <output dir> location where masked files will be written
#
# Example:
#
#   $sh mask_images.sh A42838 ./test_input_icons ./out_icons

HEX_COLOR=$1
INPUT_DIR=$2
OUTPUT_DIR=$3

echo HEX_COLOR=$HEX_COLOR
echo INPUT_DIR=$INPUT_DIR
echo OUTPUT_DIR=$OUTPUT_DIR

echo rm -rf $OUTPUT_DIR/$INPUT_DIR
rm -rf $OUTPUT_DIR/$INPUT_DIR
echo mkdir -p $OUTPUT_DIR/$INPUT_DIR
mkdir -p $OUTPUT_DIR/$INPUT_DIR
 
# test if ImageMagick is installed
if [ ! type "convert" > /dev/null ]; then
    echo ERROR: ImageMagick not intalled. Cannot find convert tool on this system
    print_usage
    exit 1
else
   echo Found ImageMagic convert tool installed:
   convert -version
fi
 
 
for filename in $INPUT_DIR/*.png; do
   convert $filename -alpha extract -background "#$HEX_COLOR" -alpha shape $OUTPUT_DIR/$filename
done

echo convert complete

exit 0
