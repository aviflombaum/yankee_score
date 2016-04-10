<!-- NOTE -->
##YankeeScore CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects.
8. program


###A command line interface to load the score of a NYY game

- user types 'yankee_score'
  1. todays game
  2. enter date
- ask user for input


#json http://gd2.mlb.com/components/game/mlb/year_2016/month_03/day_15/master_scoreboard.json


away_name_abbrev: "NYY",


Parse json https://www.twilio.com/blog/2015/10/4-ways-to-parse-a-json-api-with-ruby.html

data needed
  home team abbrev - json["data"]["games"]["game"][2]["home_name_abbrev"]
  away_team abbrev - json["data"]["games"]["game"][2]["away_name_abbrev"]

  home team score
  away team score

  date?

NYY 33 - MIN 3


1. greet user
2. show Yankee Score
3. ask user for input
  options:
  - show another team
  - show all teams
TODO: add option to go to game on MLB.com
