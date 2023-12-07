## Calculate number of possible wins
def games_beat(time, distance_end)
hold = 1
possible_wins = 0
1.upto(time) do |hold|
    holdtime = time - hold
    distance = holdtime * hold
    break if distance == 0
    possible_wins += 1 if distance > distance_end # counts the number of wins # use "puts holdtime" to see possible winning hold times   
end
possible_wins
end


# init vars
times = []
distances = []

#Extract input data and place into arrays 
File.read("input.txt").each_line do |input_data|
  if input_data.start_with?("Time")
    times = input_data.chomp.split(':')[1].split
  end

  if input_data.start_with?("Distance")
    distances = input_data.chomp.split(':')[1].split
  end
end

  
# run a loop for the number of games
numOfGames = times.length
last_wins = 1
0.upto(numOfGames) do |game_num|
    time = times[game_num].to_i
    distance_end = distances[game_num].to_i
    break if time == 0 || distance_end == 0
    puts "Game number #{game_num} will use a time of  #{time} and a distance of #{distance_end}"
    wins = games_beat(time, distance_end)
    last_wins *= wins
end

puts "Total wins(part1): #{last_wins}"


puts "### Now Part 2 ###"

## part 2
# Concat the arrays to make new time and distance_end

time = "#{times[0]}#{times[1]}#{times[2]}".to_i
distance_end = "#{distances[0]}#{distances[1]}#{distances[2]}".to_i
puts "Game part 2 will use a time of  #{time} and a distance of #{distance_end}"
puts games_beat(time, distance_end)



