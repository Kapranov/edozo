class ChartsController < ApplicationController
  def index
    @visits = Visit.all
  end

  def visits_by_day
    # render json: Visit.group_by_day(:visited_at, format: "%B %d, %Y").count
    render json: Visit.group_by_day(:visited_at).count
  end

  def sporters_by_age
    result = Sporter.group(:age).count
    # result = Sporter.top(:age, 10)
    render json: [{name: 'Count', data: result}]
  end

  def sporters_by_country
    result = {}
    Country.all.map do |c|
      result[c.name] = c.sporters.count
    end
    render json: [{name: 'Count', data: result}]
  end

  def results_by_country
    result = Country.all.map do |c|
      places = {}
      (1..6).each do |place|
        places[place] = c.sporters.joins(:competition_results).
          where("competition_results.place = #{place}").count
      end
      {
        name: c.name,
        data: places
      }
    end
    render json: result
  end

  def competitions_by_year
    # result = CompetitionResult.group_by_year(:created_at, format: "%Y").count
    result = CompetitionResult.group_by_year(:created_at).count
    render json: [{name: 'Count', data: result}]
  end
end
