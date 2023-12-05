def seed_calc(seed_array, src_start, dst_start, range_length)
  result = [] 
  range_length = range_length -1 unless range_length == 0
  src_range = (src_start..(src_start + (range_length -1))).to_a
  dst_range = (dst_start..(dst_start + (range_length -1))).to_a

  seed_array.each do |seed|
    if src_range.include?(seed)
      seed_index = src_range.index(seed)
      soil = dst_range[seed_index]
    else
      soil = seed
    end

    result << soil 
  end

  result
end

# Get Seeds array
def extract_seeds(file_contents)
  seeds_data = []

  file_contents.each_line do |line|
    if line.start_with?("seeds:")
      seeds_data = line.split(':')[1].split.map(&:to_i)
      break
    end
  end

  seeds_data
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
  
file_path = 'input_example.txt' 
file_contents = File.read(file_path)

# initialize arrays from input
seeds = extract_seeds(file_contents)

seed_to_soil_map = extract_map_data(file_contents, 'seed-to-soil map:')
soil_to_fertilizer_map = extract_map_data(file_contents, 'soil-to-fertilizer map:')
fertilizer_to_water_map = extract_map_data(file_contents, 'fertilizer-to-water map:')
water_to_light_map = extract_map_data(file_contents, 'water-to-light map:')
light_to_temperature_map = extract_map_data(file_contents, 'light-to-temperature map:')
temperature_to_humidity_map = extract_map_data(file_contents, 'temperature-to-humidity map:')
humidity_to_location_map = extract_map_data(file_contents, 'humidity-to-location map:')

# Display the resulting arrays
# puts "Seed to Soil Map: #{seed_to_soil_map.inspect}"
# puts "Soil to Fertilizer Map: #{soil_to_fertilizer_map.inspect}"
# puts "Fertilizer to Water Map: #{fertilizer_to_water_map.inspect}"
# puts "Water to Light Map: #{water_to_light_map.inspect}"
# puts "Light to Temperature Map: #{light_to_temperature_map.inspect}"
# puts "Temperature to Humidity Map: #{temperature_to_humidity_map.inspect}"
# puts "Humidity to Location Map: #{humidity_to_location_map.inspect}"
# puts "Seeds Array: #{seeds.inspect}"

all_locations = ["seed_to_soil_map", "soil_to_fertilizer_map", "fertilizer_to_water_map", "fertilizer_to_water_map", "light_to_temperature_map", "temperature_to_humidity_map", "humidity_to_location_map"]


map_count = 0
for location_map in [seed_to_soil_map, soil_to_fertilizer_map, fertilizer_to_water_map, fertilizer_to_water_map, light_to_temperature_map, temperature_to_humidity_map, humidity_to_location_map ]

      map_run = 0
      location_map.each do |map|
        # puts "Start of map run #{map_run}" if map_count == 1
        # puts "seeds: #{seeds}" if map_count == 1
        # puts "src_start: #{map[1]}" if map_count == 1
        # puts "dst_start: #{map[0]}" if map_count == 1
        # puts "range_length: #{map[2]}" if map_count == 1
        seeds = seed_calc(seeds, map[1], map[0], map[2])
        map_run += 1
        #puts if map_count == 1
      end
      #print all_locations[map_count] if map_count == 1
      puts "Seed result: #{seeds.inspect}"
      

  map_count += 1
end








# testing
#seeds = [79, 14, 55, 13]
#puts seed_calc(seeds, 50, 52, 48).inspect




