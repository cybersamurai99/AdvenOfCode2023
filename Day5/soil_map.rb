def seed_calc(seeds, src_start, dst_start, range_length)
  result = []  # Initialize an empty array
  src_range = (src_start..(src_start + (range_length -1))).to_a
  dst_range = (dst_start..(dst_start + (range_length -1))).to_a

  seeds.each do |seed|
    if src_range.include?(seed)
      seed_index = src_range.index(seed)
      soil = dst_range[seed_index]
    else
      soil = seed
    end

    result << soil  # Append the result as a hash to the array
  end

  result  # Return the array of results
end

#seeds = [79, 14, 55, 13]
seeds = [81, 14, 57, 13]

#puts seed_calc(seeds, 50, 52, 48).inspect
puts seed_calc(seeds, 0, 39, 15).inspect
