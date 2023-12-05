seeds = [ 79, 14, 55, 13]
src_start = 50
dst_start = 52
range_length = 48
src_range = (src_start..(src_start + (range_length -1))).to_a
dst_range = (dst_start..(dst_start + (range_length -1))).to_a


puts src_range.inspect

# seeds.each do |seed|
# seed_index = src_range.index(seed)
# soil = seed

# puts seed_index.inspect
# puts dst_range[seed_index].nil?

# if dst_range[seed_index].nil?
# else
#     soil = dst_range[seed_index] 
# end

# puts "Seed #{seed} -> #{soil}"
#end

