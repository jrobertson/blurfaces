#!/usr/bin/env ruby

# filename: blurfaces.rb

require 'detectfaces'
require 'rmagick'


class BlurFaces

  attr_accessor :faces

  def initialize(fname=nil)

    @df = DetectFaces.new
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
    @faces = @df.read(fname).faces
    @img = Magick::Image.read(fname)[0]

    self

  end

  def save(fname)
    @img.write(fname)
  end
  
end
