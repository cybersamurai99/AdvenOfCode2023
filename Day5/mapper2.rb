
#Step1: Parsing the puzzle input:
    #1: {1:[], 2:[]} eg: 1: seed-to-soil = [[50, 51],[98,99], ...] eg. 50 is the start and 2 is the range
    #2: if line 1: get seeds into a list [1, 2, 3, 4]
    #3: loop through the phases, and build a map {1: [.....]}
    #.  everytime you get a line with text increment a counter



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


file_path = 'input.txt' 
file_contents = File.read(file_path)

maps = Hash.new

seeds = extract_seeds(file_contents)
maps[1] = extract_map_data(file_contents, 'seed-to-soil map:')
maps[2] = soil_to_fertilizer_map = extract_map_data(file_contents, 'soil-to-fertilizer map:')
maps[3] = fertilizer_to_water_map = extract_map_data(file_contents, 'fertilizer-to-water map:')
maps[4] = water_to_light_map = extract_map_data(file_contents, 'water-to-light map:')
maps[5] = light_to_temperature_map = extract_map_data(file_contents, 'light-to-temperature map:')
maps[6] = temperature_to_humidity_map = extract_map_data(file_contents, 'temperature-to-humidity map:')
maps[7] = humidity_to_location_map = extract_map_data(file_contents, 'humidity-to-location map:')



#Step 2:
    #loop through the seeds eg. for seed in seeds:
    #   set the initialValue = seed
    #       loop through the phases eg. for phase in phases:
    #           loop through the phase ranges
    #               get the source and destination ranges of the current phase
    #                   if (src <= initialValue <= src + length - 1)
    #                       position = seed_temp - src
    #                       destination = destination + position
    #                       go to the next phase with the new seed_temp

#Step 3:
    # somehow check every seed result and compare with the current lowest value, set it as the lowest value

#puts seed_to_soil_map.inspect

last_location = 0
seeds.each do |seed|
  seed_temp = seed
  maps.each do |idx, phase|
    phase.each do |range|
        src = range[1]
        dst = range[0]
        length = range[2]

        if (src <= seed_temp) && (seed_temp <= src + length - 1)
            position = seed_temp - src
            destination = dst + position
            seed_temp = destination
            break
        end  
    end
    #puts "#{seed} -> #{seed_temp}"
  end
  puts "#{seed} -> #{seed_temp}"
  if seed_temp < last_location || last_location == 0
   last_location = seed_temp
  end
end

puts "Lowest location: #{last_location}"





