require 'carrierwave/processing/mini_magick'

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  process :resize_to_fit => [ 128, 128 ]

  version :thumb do
    process :resize_to_fill => [ 50, 50 ]
  end

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    "/images/default/" + [ "avatar", version_name ].compact.join('_') + ".png"
  end

end
