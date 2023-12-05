

def extract_seeds(file_contents)
    seeds = []

    file_contents.each_line do |line|
      if line.start_with?("seeds:")
        seeds = line.split(':')[1].split
        break
      end
    end
  
    seeds
  end

# Read the contents of the file
file_path = 'input_example.txt'
file_contents = File.read(file_path)

seeds = extract_seeds(file_contents)
puts "Seeds Array: #{seeds.inspect}"

# Initialize an array to store the numbers
# numbers_array = []

# # Flag to indicate when to start and stop adding numbers
# start_adding = false

# # Process each line in the file
# file_contents.each_line do |line|
#   # Check if the line is empty (whitespace)
#   if line.strip.empty?
#     # If an empty line is encountered, stop adding numbers
#     start_adding = false
#   elsif start_adding
#     # If start_adding is true, add the numbers from the line to the array
#     numbers_array << line.split.map(&:to_i)
#   elsif line.start_with?("seed-to-soil map:")
#     # If "seed-to-soil map:" is encountered, start adding numbers from the next line
#     start_adding = true
#   end
# end

# Display the resulting array
#puts numbers_array.inspect
