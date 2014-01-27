Activr.configure do |config|
  # skip duplicates with a one hour window
  config.skip_dup_period = 3600
end
