# Introducing the blurfaces gem

The blurfaces gem uses OpenCV to detect faces and RMagick to blur faces.

## Usage

    require 'blurfaces'

    bf = BlurFaces.new('/tmp/faces3.jpg')
    bf.blur
    bf.save '/tmp/faces3c.jpg'

## Input

file: faces3.jpg

![A drawing of 3 people](http://a0.jamesrobertson.eu/r/images/2018/feb/18/faces3.jpg)

## Output

file: faces3c.jpg

![A drawing of 3 people with blurred faces](http://a0.jamesrobertson.eu/r/images/2018/feb/19/faces3c.jpg)

## Resources

* blurfaces https://rubygems.org/gems/blurfaces

blur faces gem blurfaces facedetect rmagick opencv
