# encoding: utf-8
class IndexlinkUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  #clean cache files after upload
  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  # resize all the upload pics
  process :resize_to_limit => [990, nil]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.name}/#{model.id}"
  end

  def cache_dir
    # should return path to cache dir
    Rails.root.join 'tmp/'
  end

  # store! nil's the cache_id after it finishes so we need to remember it for deletion
  def remember_cache_id(new_file)
    @cache_id_was = cache_id
  end
  
  def delete_tmp_dir(new_file)
    # make sure we don't delete other things accidentally by checking the name pattern
    if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
      FileUtils.rm_rf(File.join(cache_dir, @cache_id_was))
    end
  end
end