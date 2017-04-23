class CreateTrackService
  def call
    %w(apple cherry).each do |track|
      new_track = Track.create({title: track})
      1000.times do
        new_track.click_tracks.create!({created_at: rand(3.years.ago..Time.now) })
      end
    end
  end
end

