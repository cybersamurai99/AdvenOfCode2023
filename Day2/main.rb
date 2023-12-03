input_data = File.open("input.txt")
#input_data = File.open("input_example.txt")

blue_limit = 14
red_limit = 12
green_limit = 13

possible_games = []

input_data.each_line do |input|

    gameID = input.split(':')[0].gsub(/[^0-9]/, '').to_i
    input_string = input.split(':')[1]
    limit_exeeded = false
    print "Game[#{gameID}] = "

    rounds = input_string.split(';')
    rounds.each do |round|
        color_counts = {}
        color_counts["red"] = 0
        color_counts["blue"] = 0
        color_counts["green"] = 0
        parts = round.split(',')
        
        parts.each do |part|
            part.scan(/(\d+) (\w+)/) do |count, color|
                color_counts[color] ||= 0
                color_counts[color] += count.to_i
            end
        end
        
        
        
        color_counts.each do |color, count|
            print "#{count} #{color} "
            if color_counts["blue"] > blue_limit || color_counts["red"] > red_limit || color_counts["green"] > green_limit
            limit_exeeded = true
            end


        end
        if limit_exeeded
            print "(LIMIT EXEEDED)"
        end
    end
    possible_games << gameID unless limit_exeeded
    puts ""
     
end

puts possible_games.inspect
sum = possible_games.inject(0, :+)
puts "Sum of of game IDs that are possible: #{sum}"

input_data.close()