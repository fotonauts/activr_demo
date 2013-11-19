class AvatarUploader < CarrierWave::Uploader::Base

  process :resize_to_fit => [ 128, 128 ]

  version :thumb do
    process :resize_to_fill => [ 50, 50 ]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url
    "/images/default/" + [ "avatar", version_name ].compact.join('_') + ".png"
  end

end
