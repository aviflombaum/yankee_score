class YankeeScore::ScoreScraper
  attr_accessor :home_team,
                :away_team,
                :home_team_runs,
                :away_team_runs


  def initialize(home_team = nil, away_team = nil)
    @home_team = home_team
    @away_team = away_team
  end

end
