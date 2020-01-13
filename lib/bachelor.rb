require 'pry'

# def get_first_name_of_season_winner(data, season)
#   data[season].each do |contestant_hash|
#     if contestant_hash["status"].downcase == "winner"
#       return contestant_hash["name"].split(" ")[0]
#     end
#   end
# end

def get_first_name_of_season_winner(data, season)
  contestant = data[season].find do |contestant|
    contestant["status"].downcase == "winner"
    end
  contestant["name"].split(" ")[0]
end


# def get_contestant_name(data, occupation)
#   data.each do |season, contestants|
#       contestants.each do |info|
#         if info["occupation"] == occupation
#           return info["name"]
#       end
#     end
#   end
# end

def get_contestant_name(data, occupation)
  find_by_occupation = data.map{|season, cast| cast}
    .flatten
    .find{|contestant| contestant["occupation"] == occupation}
  find_by_occupation["name"]
end

# def count_contestants_by_hometown(data, hometown)
#   counter = 0
#   data.each do |season, contestants|
#     contestants.each do |info|
#       if info["hometown"] == hometown
#         counter += 1
#       end
#     end
#   end
#   return counter
# end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  cast_array = data.map{|season, cast| cast}
  .flatten
  cast_array.each do |contestant|
    if contestant["hometown"] == hometown
      counter += 1
    end
  end
  counter
end

# def get_occupation(data, hometown)
#   data.each do |season, contestants|
#     contestants.each do |contestant|
#       contestant.find{ |contestant| contestant["hometown"] == hometown }
#     end
#   end
# end

def get_occupation(data, hometown)
  find_by_hometown = data.map{|season, cast| cast}
    .flatten
    .find{|contestant| contestant["hometown"] == hometown}
  find_by_hometown["occupation"]
end

# def get_average_age_for_season(data, season)
#   average_age = 0
#   number_contestants = 0
#   data[season].each do |contestant_data|
#    age = contestant_data["age"].to_i
#     average_age += age
#     number_contestants += 1
#   end
#     average_age = average_age.to_i/number_contestants.to_f
#     return average_age.round
# end

def get_average_age_for_season(data, season)
  age_array = data[season].map{|contestant| contestant["age"].to_i}
  age_num = age_array.reduce{ |sum, age| sum + age }/ age_array.length.to_f
  age_num.round
end
