require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: aws['ACCESS_KEY_ID'],
    aws_secret_access_key: aws['SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }
  config.fog_public = true
  config.fog_directory  = aws['BUCKET']
  config.asset_host = aws['AWS_S3_URL']

end
