class YankeeScore::ScoreScraper

  # def initialize(home_team = nil, away_team = nil)
  #   @home_team = home_team
  #   @away_team = away_team
  # end
  @@base_url = "http://gd2.mlb.com/components/game/mlb/"

  def date
    @date = Date.today
  end

  def build_url(date = Date.today)
    "#{@@base_url}year_#{date.year}/month_#{date.strftime("%m")}/day_#{date.strftime("%d")}/master_scoreboard.json"
  end
  def data
      url =
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      @data = response.body
  end

# data.games.game[8].away_name_abbrev

  def json
    @json ||= JSON.parse(data, symbolize_names: true)
  end

  def games
    json[:data][:games][:game]
  end

  # def find_game(team = "NYY")
  #   games.find { |game|  game[:home_name_abbrev] == team || game[:away_name_abbrev]}
  # end

  def load_games
    games.each do |game_hash|
      g =YankeeScore::Game.create_from_json(game_hash)
    end
  end

end
