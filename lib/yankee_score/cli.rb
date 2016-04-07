require "pry"

class YankeeScore::CLI
  attr_accessor :game, :url

  def initialize(home_team = nil, away_team = nil)
    @home_team = home_team
    @away_team = away_team
    @date = date
  end


  def call
    show_score
    # more_games
  end

  def show_score
    puts "Welcome to Yankee Score!"
    # puts "Today's Scores"
    # require "pry" ; binding.pry
    puts score_board if find_game
  end

  def score_board
    "#{home_team} #{runs[:home]} - #{away_team} #{runs[:away]}"
  end

  def more_games
    input = nil
    while input != "exit"
      puts "1. Show yesterday's score"
      puts "2. Go to date"

      input = gets.strip

      case input
      when "1"
        yesterdays_game
      when "2"
        get_game_by_date
      when "exit"
        exit
      else
        puts "Please enter a valid date!"
      end
    end
  end

  def yesterdays_game
    # TODO: go to yesterday's score
    puts "#{home_team} 33 - #{away_team} 3"
  end

  def get_game_by_date
    puts "enter date (m/day/year)"
    date = gets.strip
    puts "Today is #{date}"
    # TODO: go to 'date' score
    puts "#{home_team} 9 - #{away_team} 15 "
  end

  def date
    @date = Date.today
  end


  def yesterday
    date -= 1
  end


  def data
    unless @data
      @url =  "http://gd2.mlb.com/components/game/mlb/year_#{date.year}/month_#{date.strftime("%m")}/day_#{date.strftime("%d")}/master_scoreboard.json"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      @data = response.body
    else
      @data
    end
  end

# data.games.game[8].away_name_abbrev

  def json
    @json ||= JSON.parse(data, symbolize_names: true)
  end

  def games
    json[:data][:games][:game]
  end

  def find_game(team = "NYY")
    games.find { |game|  game[:home_name_abbrev] == team || game[:away_name_abbrev]}
  end

  def home_team
    find_game[:home_name_abbrev]
  end

  def away_team
    find_game[:away_name_abbrev]
  end

  def runs
    find_game[:linescore][:r]
  end



  # json["data"]["games"]["game"].each do |team|
  # end










end
