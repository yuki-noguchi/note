class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "#{Time.now.strftime('%Y%m%d%H%M')}.jpg" if original_filename.present?
  end

end
