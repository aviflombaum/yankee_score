class YankeeScore::Game
  attr_accessor :home_team,
                :away_team,
                :start_time,
                :status,
                :inning,
                :inning_state

  def initialize(home_team, away_team)
    @home_team = home_team
    @away_team = away_team
  end

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
