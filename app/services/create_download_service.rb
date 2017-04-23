class CreateDownloadService
  def call
    15.times do
      Download.create(ip: Faker::Internet.ip_v4_address)
    end
  end
end
