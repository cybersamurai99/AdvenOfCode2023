last_cubes = 0
File.open("input.txt") do |input_data|
  blue_limit = 14
  red_limit = 12
  green_limit = 13

  input_data.each_line do |input|
    gameID = input.split(':')[0].gsub(/[^0-9]/, '').to_i
    input_string = input.split(':')[1]
    limit_exceeded = false

    print  "Game[#{gameID}] = "

    rounds = input_string.split(';')
    last_color_counts = { "red" => 0, "blue" => 0, "green" => 0 }

    rounds.each do |round|

        color_counts = { "red" => 0, "blue" => 0, "green" => 0 }
        parts = round.split(',')
        
        parts.each do |part|
            part.scan(/(\d+) (\w+)/) do |count, color|
                color_counts[color] ||= 0
                color_counts[color] += count.to_i
            end
        end
    
        color_counts.each do |color, count|
            if count > last_color_counts[color]
                last_color_counts[color] = count     
        end

    end 

    end
    cubes = last_color_counts["red"] * last_color_counts["blue"] * last_color_counts["green"]
    puts cubes
    last_cubes += cubes
  end
  
  puts 
  
end

puts last_cubes
