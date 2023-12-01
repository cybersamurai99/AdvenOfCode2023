input = File.open("input.txt")
result = 0

require 'numbers_in_words'
def numbers_list
    words_array = (0..99).map { |number| NumbersInWords.in_words(number) }
    words_array.each { |word| word.delete("-") } 
end

result_array = []
input.each_line do |input_string|
    numeric_words = input_string.scan(/(?:#{numbers_list.join('|')})/i)
    result_array << numeric_words unless numeric_words.empty?     
end

puts "#{result_array}"