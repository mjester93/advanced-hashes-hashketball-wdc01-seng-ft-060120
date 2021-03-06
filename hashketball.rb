require 'pry'

# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player_name)
  game_hash[:home][:players].each do |x, values|
    if x[:player_name] == player_name
      return x[:points]
    end
  end

  game_hash[:away][:players].each do |x, values|
    if x[:player_name] == player_name
      return x[:points]
    end
  end
end


def shoe_size(player_name)
  game_hash[:home][:players].each do |x, values|
    if x[:player_name] == player_name
      return x[:shoe]
    end
  end

  game_hash[:away][:players].each do |x, values|
    if x[:player_name] == player_name
      return x[:shoe]
    end
  end
end


def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end


def team_names
  return [
    game_hash[:home][:team_name],
    game_hash[:away][:team_name]
  ]
end

def player_numbers(team_name)
  numbers = []

  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |x, values|
      numbers.push(x[:number])
    end
  else
    game_hash[:away][:players].each do |x, values|
      numbers.push(x[:number])
    end
  end

  return numbers
end


def player_stats(player_name)
  game_hash[:home][:players].each do |x, values|
    if x[:player_name] == player_name
      return x
    end
  end

  game_hash[:away][:players].each do |x, values|
    if x[:player_name] == player_name
      return x
    end
  end
end


def big_shoe_rebounds
  max_shoe_size = -99999
  max_shoe_size_name = ""

  game_hash[:home][:players].each do |x, values|
    if x[:shoe] >= max_shoe_size
      max_shoe_size = x[:shoe]
      max_shoe_size_name = x[:player_name]
    end
  end

  game_hash[:away][:players].each do |x, values|
    if x[:shoe] >= max_shoe_size
      max_shoe_size = x[:shoe]
      max_shoe_size_name = x[:player_name]
    end
  end

  puts max_shoe_size_name
  return player_stats(max_shoe_size_name)[:rebounds]
end


def most_points_scored
  max_points = -99999
  max_points_name = ""

  game_hash[:home][:players].each do |x, values|
    if x[:points] >= max_points
      max_points = x[:points]
      max_points_name = x[:player_name]
    end
  end

  game_hash[:away][:players].each do |x, values|
    if x[:points] >= max_points
      max_points = x[:points]
      max_points_name = x[:player_name]
    end
  end

  return max_points_name
end


def winning_team
  home_score = 0
  away_score = 0

  game_hash[:home][:players].each do |x, values|
    home_score += x[:points]
  end

  game_hash[:away][:players].each do |x, values|
    away_score += x[:points]
  end

  if home_score > away_score
    return game_hash[:home][:team_name]
  elsif away_score > home_score
    return game_hash[:away][:team_name]
  else
    return "TIE"
  end
end


def player_with_longest_name
  max_letters = 0
  max_letters_name = ""

  game_hash[:home][:players].each do |x, values|
    if x[:player_name].length >= max_letters
      max_letters = x[:player_name].length
      max_letters_name = x[:player_name]
    end
  end

  game_hash[:away][:players].each do |x, values|
    if x[:player_name].length >= max_letters
      max_letters = x[:player_name].length
      max_letters_name = x[:player_name]
    end
  end

  return max_letters_name
end


def long_name_steals_a_ton?
  max_steals = -99999
  max_steals_name = ""

  game_hash[:home][:players].each do |x, values|
    if x[:steals] >= max_steals
      max_steals = x[:points]
      max_steals_name = x[:player_name]
    end
  end

  game_hash[:away][:players].each do |x, values|
    if x[:steals] >= max_steals
      max_steals = x[:points]
      max_steals_name = x[:player_name]
    end
  end

  if max_steals_name == player_with_longest_name
    return true
  else
    return false
  end
end
