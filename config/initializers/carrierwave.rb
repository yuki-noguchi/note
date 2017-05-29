require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.access_key_id,
    aws_secret_access_key: Rails.application.secrets.secret_access_key,
    region: 'ap-northeast-1'
  }
  config.fog_public = true
  config.fog_directory  = Rails.application.secrets.bucket
  config.asset_host = Rails.application.secrets.s3_url

end
