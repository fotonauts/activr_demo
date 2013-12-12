CarrierWave.configure do |config|
  if ENV['S3_ACCESS_KEY_ID'] && ENV['S3_SECRET_ACCESS_KEY'] && ENV['S3_BUCKET']
    config.storage = :fog

    config.cache_dir = "#{Rails.root}/tmp/uploads"

    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['S3_SECRET_ACCESS_KEY'],
    }
    config.fog_directory = ENV['S3_BUCKET']
    config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
  else
    config.storage = :file
  end

  # config.storage = :grid_fs
  # config.grid_fs_connection = Mongoid.database
  # config.root = Rails.root.join('tmp')
  # config.cache_dir = "uploads"
end
