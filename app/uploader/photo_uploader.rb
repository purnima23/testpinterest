class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  process :resize_to_fit => [200,200]

  version :thumb do
    process :resize_to_fill => [200,200]
  end

  def store_dir
    'images'
  end


end