#!/bin/bash

echo "Please drag you input File."
read varInput

varOutput=$varInput
varInput=${varInput//_//}
varOutput="${varOutput//Output/}"

varFFM="ffmpeg -i $varInput"
varMXFnoAudio="-c:v dnxhd -vf "scale=1920:1080, format=yuv422p" -b:v 36M -an"
varMXFwAudio="-c:v dnxhd -vf "scale=1920:1080, format=yuv422p" -b:v 36M"

echo "$varInput"

echo "For MXF with Audio press 1, for MXF without Audio press 2"

read varSwitch
  case $varSwitch in
    1) "$varFFM $varMXFwAudio Output.mxf" ;;
    2) echo"$varFFM $varMXFnoAudio $varOutput" ;;
    *) echo"please choose a valid input!" ;;
  esac

#MXF ffmpeg -i INPUT -c:v dnxhd -vf "scale=1920:1080, format=yuv422p" -b:v 36M -an OUTPUT
#h264 ffmpeg -i INPUT -c:v libx264 -pix_fmt yuv420p "${OUTPUT%}h264.mov"; # % appends string to variable
#prores ffmpeg -i INPUT -c:v prores -profile:v 2 OUTPUT.mov #prores SQ Profile changes Pro Res Quality
#AC3 ffmpeg -drc_scale: 0 -i INPUT OUTput.wav
