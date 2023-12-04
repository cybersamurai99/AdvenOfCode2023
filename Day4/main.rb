def sort_input(input_data)
    winning_score = []
    input_data.each_line do |input|
      card_number = input.split(':')[0].gsub(/[^0-9]/, '').to_i
      input = input.split(':')[1]
      my_numbers = input.split('|')[1].split(" ")
      win_numbers = input.split('|')[0].split(" ")

     #puts "Checking Card #{card_number}"
     matches_found = 0
      for x in my_numbers
        win_numbers.each do |y|
             if x == y
                matches_found += 1
             end
        end
      end
      #puts "Found #{matches_found}"
      puts "Card #{card_number} found #{matches_found} wins" unless matches_found == nil
      value = 1 if matches_found > 0
      iterations = matches_found - 1
      result = value
      
      iterations.times do
        result = value + value
        value = result
      end
      winning_score << result unless result == nil
      
    end

    puts "\e[31m#{winning_score.sum}\e[0m"
  end
  

  File.open("input.txt") do |input_data|
    sort_input(input_data)
  end
  