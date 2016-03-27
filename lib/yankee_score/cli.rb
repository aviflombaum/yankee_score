require "pry"

class YankeeScore::CLI
  attr_accessor :game



  def call
    show_score
    # more_games
  end

  def show_score
    puts "Welcome to Yankee Score!"
    # puts "Today's Scores"
    puts "#{home_team} #{runs["home"]} - #{away_team} #{runs["away"]}"
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

  def master_scoreboard


  end

  def data
    url = "http://gd2.mlb.com/components/game/mlb/year_2016/month_03/day_27/master_scoreboard.json"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    @data = response.body
  end

# data.games.game[8].away_name_abbrev

  def json
    @json ||= JSON.parse(self.data)
  end

  # json["data"]["games"]["game"].each do |team|
  # end
  def away_team
    @away_team ||= json["data"]["games"]["game"][2]["away_name_abbrev"]
  end

  def home_team
    @home_team ||= json["data"]["games"]["game"][2]["home_name_abbrev"]
  end

  def linescore
    @linescore ||= json["data"]["games"]["game"][2]["linescore"]
  end

  def runs
    @runs ||= linescore["r"]
  end







end
