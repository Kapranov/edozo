namespace :cache_shrine do
  desc "Shrine Cache Clean | clean temporary storage from old files"
  task clean_cache: :environment do
    file_system = Shrine.storages[:cache]
    file_system.clear!(older_than: Time.now)
  end

  desc "Shrine Store Clean | clean temporary storage from old files"
  task clean_store: :environment do
    file_system = Shrine.storages[:store]
    file_system.clear!(older_than: Time.now)
  end
end
