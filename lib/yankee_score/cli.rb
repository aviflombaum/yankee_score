require "pry"

class YankeeScore::CLI
  attr_accessor :game, :url, :date
  attr_reader :score_scraper

  def initialize
    @score_scraper = YankeeScore::ScoreScraper.new
    @score_scraper.load_games
  end




  def call
    search("NYY")
    puts
    list_games
  end

  def show_score

    # puts "Today's Scores"
    # require "pry" ; binding.pry
    # score_board

    # require "pry" ; binding.pry
    puts "#{game.home_team} #{game.home_team_runs} - #{game.away_team} #{game.away_team_runs}"
  end

  def score_board
    require "pry" ; binding.pry
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

  def search(team = "NYY")
    YankeeScore::Game.all.each do |game|
      if game.home_team == team
        puts "#{game.home_team} #{game.home_team_runs} - #{game.away_team} #{game.away_team_runs}"
      end
    end
  end

  def get_game_by_date
    puts "enter date (m/day/year)"
    date = gets.strip
    puts "Today is #{date}"
    # TODO: go to 'date' score
    puts "#{home_team} 9 - #{away_team} 15 "
  end

  def list_games
    YankeeScore::Game.all.find do |game|
      # require "pry" ; binding.pry
      puts "#{game.home_team} #{game.home_team_runs} - #{game.away_team} #{game.away_team_runs}"
    end
  end

  # :home_team,
  #               :away_team,
  #               :home_team_runs,
  #               :away_team_runs,
  #               :runs,
  #               :start_time
  #
  #
  #

  def yesterday
    date -= 1
  end





  # json["data"]["games"]["game"].each do |team|
  # end










end
