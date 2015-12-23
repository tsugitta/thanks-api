# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file
  process :resize_to_fill => [150, 150]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
