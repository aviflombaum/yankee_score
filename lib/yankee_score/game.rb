class YankeeScore::Game
  attr_accessor :home_team,
                :away_team,
                :start_time,
                :status,
                :inning,
                :inning_state,
                :score


  def initialize(home_team, away_team)
    @home_team = home_team
    @away_team = away_team
  end

  @@all = []

  def save
    @@all << self
  end

  def is_over?
    self.status == "Final" || self.status == "Postponed" || self.status == "Game Over"
  end

  def is_active?
    not_active = ["Pre-Game","Preview", "Warmup"]
    self.inning.to_i >= 1 && !is_over? && !not_active.include?(status)
  end



  def self.all
    @@all
  end

  def self.reset_all!
    @@all.clear
  end

end
