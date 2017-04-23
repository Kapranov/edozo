class CreateCompetitionService
  def call
    %w(tennis parachuting badminton archery chess boxing racing golf running skiing walking cycling surfing swimming skeleton).each {|c| Competition.create({title: c}) }
  end
end

