input = File.open("input.txt")
#input = File.open("example_input_part2.txt")
result = 0

require 'numbers_in_words'

number_list = [ "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "1", "2", "3", "4", "5", "6", "7", "8", "9" ]


input.each_line do |line|
    puts "Input was #{line}"
    matches_array = []

    # Iterate over each character in the string
    for i in 0..line.length - 1
    # Check for the start of a substring
        number_list.each do |substring|
            if line.index(substring, i) == i
            # Store the match in the array
            matches_array << substring
            end
        end
    end
    
    puts "Found numbers are: #{matches_array}"

    for x in 0..matches_array.length - 1
        matches_array[x] = NumbersInWords.in_numbers(matches_array[x]).to_int
    end
    puts "Converted arrays is #{matches_array.inspect}"
    firstNumber = matches_array[0]
    lastNumber = matches_array[-1]
    puts "firstNumber = #{matches_array[0]}"
    puts "lastNumber = #{matches_array[-1]}"
    temp_result = "#{firstNumber}#{lastNumber}"
    puts temp_result
    result = result + temp_result.to_i
    puts result
    puts
    puts
end

input.close
