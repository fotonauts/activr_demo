CarrierWave.configure do |config|
  config.storage = :file

  # config.storage = :grid_fs
  # config.grid_fs_connection = Mongoid.database
  # config.root = Rails.root.join('tmp')
  # config.cache_dir = "uploads"
end
