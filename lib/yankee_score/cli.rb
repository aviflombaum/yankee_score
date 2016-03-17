class YankeeScore::CLI

  def call
    show_score
    more_games
  end

  def show_score
    puts "Today's Scores"
    puts "NYY 6 - BOS 3"
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
    puts "NYY 33 - BOS 3"
  end

  def get_game_by_date
    puts "enter date (m/day/year)"
    date = gets.strip
    puts "Today is #{date}"
    # TODO: go to 'date' score
    puts "NYY 9 - BOS 15 "
  end

end
