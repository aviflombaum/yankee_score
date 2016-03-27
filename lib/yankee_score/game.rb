class YankeeScore::GameDay
  attr_accessor :home_team, 
                :away_team,
                :home_team_runs,
                :away_team_runs

  def initialize
    @home_team = json["data"]["games"]["game"][2]["home_name_abbrev"]
    @away_team = json["data"]["games"]["game"][2]["away_name_abbrev"]
  end

end
