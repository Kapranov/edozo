require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :cached_attachment_data
  plugin :remove_attachment
  plugin :determine_mime_type
  plugin :pretty_location
  plugin :processing
  plugin :versions
  plugin :delete_raw
  plugin :store_dimensions
  plugin :processing
  plugin :validation_helpers
  plugin :logging, logger: Rails.logger

  def process(io, context)
    case context[:phase]
    when :store
      small = resize_to_limit!(io.download, 25, 25)
      thumb = resize_to_limit!(io.download, 200, 200)
      large = resize_to_limit!(io.download, 300, 300)

      { original: io, thumb: thumb, small: small, large: large }
    end
  end

  Attacher.validate do
    validate_max_size 1.megabyte, message: "is too large (max is 1 MB)"
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png']
  end
end
