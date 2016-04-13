class YankeeScore::Game
  attr_accessor :home_team,
                :away_team,
                :start_time,
                :status,
                :inning,
                :inning_state,
                :score

  END_GAME_STATES = ["Final", "Postponed", "Game Over"]
  PRE_GAME_STATES = ["Pre-Game","Preview", "Warmup"]

  def self.create_from_json(game_hash)
    g = YankeeScore::Game.new(YankeeScore::Team.new(game_hash[:home_name_abbrev]), YankeeScore::Team.new(game_hash[:away_name_abbrev]))


    g.start_time = game_hash[:time]
    g.status = game_hash[:status][:status]
    g.inning = game_hash[:status][:inning]
    g.inning_state = game_hash[:status][:inning_state]

    # g.matchup = game_hash[:game_media][:media][:title]

    if game_hash.has_key?(:linescore)
      g.home_team.runs = game_hash[:linescore][:r][:home]
      g.away_team.runs = game_hash[:linescore][:r][:away]
      g.score = "#{g.away_team.runs} - #{g.home_team.runs}"
    end

    g.save
  end

  def initialize(home_team, away_team)
    @home_team = home_team
    @away_team = away_team
  end

  def self.find_by_team(team)
    self.all.select do |game|
      team == game.home_team.name || team == game.away_team.name
    end
  end

  @@all = []

  def save
    @@all << self
  end

  def summary
    self.score || self.start_time
  end

  def is_over?
    END_GAME_STATES.include?(self.status)
    # self.status == "Final" || self.status == "Postponed" || self.status == "Game Over"
  end

  def is_active?
    self.inning.to_i >= 1 && !is_over? && !PRE_GAME_STATES.include?(status)
  end



  def self.all
    @@all
  end

  def self.reset_all!
    @@all.clear
  end

end
