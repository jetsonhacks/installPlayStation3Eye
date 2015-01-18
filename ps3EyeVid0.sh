#!/bin/sh
# Show a PS3 Eye webcam
VELEM="v4l2src device=/dev/video0"
VCAPS="ffmpegcolorspace ! video/x-raw-yuv, width=640, height=480, framerate=30/1"
VSOURCE="$VELEM ! $VCAPS"
VIDEO_SINK="xvimagesink sync=false"
VIDEO_DECODE="jpegparse ! jpegdec"
 
# echo is just for debugging purposes
echo gst-launch-0.10 -vvv \
$VSOURCE \
! $VIDEO_SINK
 
gst-launch-0.10 -vvv \
$VSOURCE \
! $VIDEO_SINK 
