class HomeController < ApplicationController

  def result
    require 'rubygems'
    require 'RMagick'
    require 'twitter_api'
    require 'json'
    require 'open-uri'

    #送信された文字列を10文字ずつ分割
    sentCaption = params["caption"]
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

# twitterAPIの認証
    twitterAPI = TwitterAPI::Client.new({
      :consumer_key => '',
      :consumer_secret => '',
      :token => '',
      :token_secret => ''
    })


# 画像をアップロードしてmedia_idを取得
    image = File.open(imgPath, 'rb').read
    uploadImage = twitterAPI.media_upload({'media' => image})
    media_id = JSON.parse(uploadImage.body)['media_id']

# 画像を投稿して画像URLを作成
    sendImage = twitterAPI.statuses_update({
      'status' => sentCaption,
      'media_ids' => media_id
    })

     p sendImage

    status_id = JSON.parse(sendImage.body)['id_str']


    # binding.pryk
    @imageURL = 'https://twitter.com/KtRailsApp/status/' + status_id.to_s + '/photo/1'
    # binding.pry


  end

  def top

  end
end
