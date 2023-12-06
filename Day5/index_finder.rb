def seed_calc(seeds, src_start, dst_start, range_length)
    result = []

    seeds.each do |seed|
        index = nil

        for x in src_start..(src_start + (range_length - 1))
            if x == seed
                index = x - src_start

                break
            else
                
            end
        end

        soil = index ? dst_start + index : seed
        result << soil
    end

    result
end

#seeds = [79, 14, 55, 13]
#seeds = [81, 14, 57, 13]
seeds = [81, 53, 57, 52]

puts seed_calc(seeds, 18, 88, 7).inspect
puts seed_calc(seeds, 25, 18, 70).inspect

