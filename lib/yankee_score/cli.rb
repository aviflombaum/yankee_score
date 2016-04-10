require "pry"


class YankeeScore::CLI
  attr_accessor :game, :url, :date
  attr_reader :score_scraper

  def initialize
    @score_scraper = YankeeScore::ScoreScraper.new
    @score_scraper.load_games
  end




  def call
    greet_user
    search_team("NYY")
    menu

  end

  def greet_user
    puts "Welcome to Yankee Score CLI"
  end

  def menu
    input = nil
    while input != "exit"
      puts
      puts "1. Show another team"
      puts "2. Show all teams"
      puts

      input = gets.strip

      case input
      when "1"
        puts "Enter Team name you would like to see."
        answer = gets.strip.upcase
        search_team(answer)
      when "2"
        list_games
      when "exit"
        puts
        puts "It ain't over till it's over. - Yogi Berra"
        puts
        exit
      else

      end
    end
  end

  def search_team(team = nil)
    YankeeScore::Game.all.each do |game|
      if team == game.home_team || team == game.away_team
        print_game(game)
      end
    end
  end

  def print_game(game)
    puts
    puts "    ============"
    puts "     #{game.away_team} | #{game.away_team_runs || "-"}"
    puts "    -----------"
    puts "     #{game.home_team} | #{game.home_team_runs || "-"}"
    puts "    ============"
    puts
    puts "First pitch: #{game.start_time}" unless game.status == "Final"
    puts  "#{game.inning_state} #{game.inning}"
    puts
    puts "Game Status: #{game.status}"
  end

  def list_games
    YankeeScore::Game.all.find do |game|
      puts "#{game.home_team} #{game.home_team_runs || "-"}  #{game.away_team} #{game.away_team_runs}"
    end
  end


end
