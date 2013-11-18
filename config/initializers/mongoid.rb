Mongoid.configure do |config|
  config.allow_dynamic_fields = false
  config.parameterize_keys    = false
  config.persist_in_safe_mode = true
end
