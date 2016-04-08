class YankeeScore::Game
  attr_accessor :home_team,
                :away_team,
                :home_team_runs,
                :away_team_runs,
                :runs,
                :start_time
  @@all = []


  def save
    @@all << self
  end


  def self.all
    @@all
  end

  def self.reset_all!
    @@all.clear
  end

end
