utils
=====

A repo of misc command-line utilities, mostly useful for mobile development & CI systems

ImageMagick
=====

Some utils require ImageMagick. If needed, install with the following steps on OS X:

1) Install XCode commad-line tools: `$xcode-select --install`

2) Install MacPorts (http://www.macports.org)

3) Install ImageMagick: `$sudo port install ImageMagick`

4) Verify you have the ImageMagick `convert` tool installed: `$which convert`

create_app_launcher_icons.sh
======

*Pre-requisite*: ImageMagick

Example:

1) cd into this directory

2)  `$sh create_app_launcher.sh test_input_icon.png`

3) See resized icons in `./out_icons` directory

