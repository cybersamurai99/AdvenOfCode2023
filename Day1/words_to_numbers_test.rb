input = "eightwothree"
matches_array = []
substrings = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

# Iterate over each character in the string
for i in 0..input.length - 1
# Check for the start of a substring
    substrings.each do |substring|
        if input.index(substring, i) == i
        # Store the match in the array
        matches_array << substring
        end
    end
end

puts "Matches array: #{matches_array}"