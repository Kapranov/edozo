require "shrine"
require "shrine/storage/file_system"

Shrine.plugin :activerecord
Shrine.plugin :restore_cached_data
Shrine.plugin :logging, logger: Rails.logger

# Shrine.plugin :download_endpoint, storages: [:store],
#   prefix: "home/kapranov/edozo/attachments/uploads",
#   host: "http://localhost:3000"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
}
