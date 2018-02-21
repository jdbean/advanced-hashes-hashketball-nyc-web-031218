require 'pry'

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18 ,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },
      }
    }
  }
end

def player_data(player_name)
  game_hash.each do |team_role, team_data|
    team_data[:players].each do |name, data|
      if name == player_name
        return data
      end
    end
  end
end


def player_attribute(player_name, attribute_sym)
  player_data(player_name)[attribute_sym]
end


def num_points_scored(player_name)
  player_attribute(player_name, :points)
end

def shoe_size(player_name)
  player_attribute(player_name, :shoe)
end

def team_colors(team)
  game_hash.each do |team_role, team_data|
    if team_data[:team_name].to_s == team
      return team_data[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |team_role, team_data|
    names << team_data[:team_name]
  end
  names
end

def player_numbers(team)
  team_location = ""
  game_hash.each do |team_role, team_data|
    if team_data[:team_name].to_s == team
      team_location = team_role
      break
    end
  end
  game_hash[team_location][:players].collect do |name, player_data|
      player_data.fetch(:number)
  end
end

player_numbers("Charlotte Hornets")

def player_stats (player_name)
  player_data(player_name)
end

def shoe_sizes
  game_hash.collect do |team_role, team_data|
    team_data[:players].collect do |player, data|
      data[:shoe]
    end
  end
end


def biggest_shoe
  biggest_shoe = shoe_sizes.flatten.sort[-1]
end


def big_shoe_rebounds
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      if data[:shoe] == biggest_shoe
        return data[:rebounds]
      end
    end
  end
end

def most_points_scored
  points_array = game_hash.collect do |team_role, team_data|
    team_data[:players].collect do |player, data|
      data[:points]
    end
  end
  highest_points = points_array.flatten.sort[-1]
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      if data[:points] == highest_points
        return player
      end
    end
  end
end

def winning_team
  points_array = game_hash.collect do |team_role, team_data|
    team_data[:players].collect do |player, data|
      data[:points]
    end
  end
  point_totals = points_array.collect do |indiv_points_array|
    indiv_points_array.sum
  end
  binding.pry
end

winning_team
