File.open("input_example.txt") do |input_data|
    input_data.each_line do |input|
     puts input.chomp.length
     
    end
end