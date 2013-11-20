require 'carrierwave/processing/mini_magick'

class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  process :resize_to_limit => [ 800, 600 ]

  version :medium do
    process :resize_to_limit => [ 400, 300 ]
  end

  version :small do
    process :resize_to_fill => [ 200, 150 ]
  end

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
    placeholder_name = case version_name
    when :medium
      '400x300'
    when :small
      '200x150'
    when :thumb
      '50x50'
    else
      '800x600'
    end

    "http://placehold.it/#{placeholder_name}"
  end

end
