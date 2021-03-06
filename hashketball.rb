# Write your code here!

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        },
      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10,
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12,
        },
      },
    }
  }
  game_hash
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |name, stats|
          if name == player
            stats.each do |stat, score|
              if stat == :points
                return score
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |name, stats|
          if name == player
            stats.each do |stat, size|
              if stat == :shoe
                return size
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if data == team_name
        return team_data[:colors]
      end
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if attributes == :team_name
        team_names << data
      end
    end
  end
  team_names
end

def player_numbers(name_of_team)
  result = []
  game_hash.each do |location, team_data|
    team_data.each do |attributes, data|
      if data == name_of_team
        team_data[:players].each do |player, stats|
          stats.each do |stat, data|
            if stat == :number
              result << data
            end
          end
        end
      end
    end
  end
  result
end

def player_stats(name_of_player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if name_of_player == player
        return stats
      end
    end
  end
end

# def big_shoe_rebounds
#   player_shoe_size = []
#   game_hash.each do |location, team_data|
#     team_data.each do |attributes, data|
#       if attributes == :players
#         data.each do |player, player_data|
#           player_shoe_size << [player, player_data[:shoe]]
#         end
#       end
#     end
#   end
#
#   player_with_biggest_shoe = player_shoe_size.sort_by { |player| player[1] }.last[0]
#
#   game_hash.each do |location, team_data|
#     team_data.each do |attributes, data|
#       if attributes == :players
#         data.each do |player, player_data|
#           if player == player_with_biggest_shoe
#             player_data.each do |stat, data|
#               if stat == :rebounds
#                 return data
#               end
#             end
#           end
#         end
#       end
#     end
#   end
# end

def big_shoe_rebounds
  shoe_sizes_arr = []

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, player_data|
      shoe_sizes_arr << [player, player_data[:shoe]]
    end
  end

  player_with_largest_shoe = shoe_sizes_arr.sort_by! { |player| player[1] }.last[0]

  game_hash.each do |location, team_data|
    team_data[:players].each do |player, player_data|
      if player == player_with_largest_shoe
        return player_data[:rebounds]
      end
    end
  end
end
