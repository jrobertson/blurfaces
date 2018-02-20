#!/usr/bin/env ruby

# filename: blurfaces.rb

require 'opencv'
require 'rmagick'


class BlurFaces

  attr_accessor :faces

  def initialize(fname=nil, haar_xml_file: File.join(File.dirname(__FILE__),\
       'haarcascade_frontalface_alt.xml'))

    @detector = OpenCV::CvHaarClassifierCascade::load haar_xml_file

    read(fname) if fname 

  end

  def blur(strength: 8)

    @faces.each do |x, y, width, height|

      region = @img.dispatch(x, y, width, height, 'RGB')
      face_img = Magick::Image.constitute(width, height, "RGB", region)

      @img.composite!(face_img.gaussian_blur(0, strength), x, y, 
        Magick::OverCompositeOp)

    end

  end

  def read(fname)

    @fname = fname
    @faces = detect_faces(fname)
    @img = Magick::Image.read(fname)[0]

    self

  end

  def save(fname)
    @img.write(fname)
  end

  private

  def detect_faces(fname)

    image = OpenCV::IplImage::load fname

    a = @detector.detect_objects(image)
    a.map {|img| [img.x, img.y, img.width, img.height]}

  end

end
