class CreateCompetitionResultService
  def call
    Competition.all.each do |competition|
      sporters = Sporter.all.shuffle.first(6)
      (1..6).each do |place|
        CompetitionResult.create({
          sporter_id: sporters.pop.id,
          competition_id: competition.id,
          place: place,
          created_at: rand(5.years.ago..Time.now)
        })
      end
    end
  end
end
