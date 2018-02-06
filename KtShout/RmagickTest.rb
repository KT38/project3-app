require 'rubygems'
require 'RMagick'
require 'twitter_api'
require 'json'
require 'open-uri'

sentCaption = 'うわあああああ'
caption = sentCaption.scan(/.{1,#{10}}/)


@resultImage = sentCaption + '.jpg'
imgPath = './app/assets/images/' + sentCaption + '.jpg'
img = Magick::ImageList.new('ktTalk.jpg')
draw = Magick::Draw.new

draw.annotate(img, 0, 0, 275, 30, caption[0]) do
  self.font      = 'TanukiMagic.ttf'
  self.fill      = 'black'
  self.stroke    = 'transparent'
  self.pointsize = 20
  self.gravity   = Magick::NorthWestGravity
end

if caption[1]
  draw.annotate(img, 0, 0, 275, 60, caption[1]) do
    self.font      = 'TanukiMagic.ttf'
    self.fill      = 'black'
    self.stroke    = 'transparent'
    self.pointsize = 20
    self.gravity   = Magick::NorthWestGravity
  end
end

if caption[2]
  draw.annotate(img, 0, 0, 275, 90, caption[2]) do
    self.font      = 'TanukiMagic.ttf'
    self.fill      = 'black'
    self.stroke    = 'transparent'
    self.pointsize = 20
    self.gravity   = Magick::NorthWestGravity
  end
end

img.write(imgPath)
