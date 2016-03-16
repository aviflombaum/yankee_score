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
    puts "1. Show yesterday's score"
    puts "2. Go to date"
  end

end
