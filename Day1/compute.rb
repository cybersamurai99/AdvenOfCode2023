input = File.open("input.txt")
result = 0

input.each_line do |line|
    line = line.gsub(/[^0-9]/, '')
    firstNumber = line[0]
    lastNumber = line[-1]
    temp_result = "#{firstNumber}#{lastNumber}"
    result = result + temp_result.to_i  
end
puts result