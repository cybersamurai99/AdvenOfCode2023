# ### turn in to function ##
# seed = 79
# src_start = 50
# dst_start = 52
# range_length = 48
# src_range = (src_start..(src_start + (range_length -1))).to_a
# dst_range = (dst_start..(dst_start + (range_length -1))).to_a

# seed_index = src_range.index(seed)

# soil = dst_range[seed_index]

# puts "Seed #{seed} -> #{soil}"

# ####




## Get Seeds array
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

# Get map data
def extract_map_data(file_contents, section_title)
    numbers_array = []
    start_adding = false
  
    file_contents.each_line do |line|
      if line.strip.empty?
        start_adding = false
      elsif start_adding
        numbers_array << line.split.map(&:to_i)
      elsif line.start_with?(section_title)
        start_adding = true
      end
    end
  
    numbers_array
end
  
file_path = 'input.txt' 
file_contents = File.read(file_path)

seeds = extract_seeds(file_contents)

seed_to_soil_map = extract_map_data(file_contents, 'seed-to-soil map:')
soil_to_fertilizer_map = extract_map_data(file_contents, 'soil-to-fertilizer map:')
fertilizer_to_water_map = extract_map_data(file_contents, 'fertilizer-to-water map:')
water_to_light_map = extract_map_data(file_contents, 'water-to-light map:')
light_to_temperature_map = extract_map_data(file_contents, 'light-to-temperature map:')
temperature_to_humidity_map = extract_map_data(file_contents, 'temperature-to-humidity map:')
humidity_to_location_map = extract_map_data(file_contents, 'humidity-to-location map:')

# Display the resulting arrays
puts "Seed to Soil Map: #{seed_to_soil_map.inspect}"
puts "Soil to Fertilizer Map: #{soil_to_fertilizer_map.inspect}"
puts "Fertilizer to Water Map: #{fertilizer_to_water_map.inspect}"
puts "Water to Light Map: #{water_to_light_map.inspect}"
puts "Light to Temperature Map: #{light_to_temperature_map.inspect}"
puts "Temperature to Humidity Map: #{temperature_to_humidity_map.inspect}"
puts "Humidity to Location Map: #{humidity_to_location_map.inspect}"

puts "Seeds Array: #{seeds.inspect}"


