def selective_map(arr, &my_proc)
  arr.each_with_object([]) do |ele, new_arr|
    new_arr << ele if my_proc.call(ele)
  end
end

is_even = Proc.new { |n| n.even? }
p selective_map([1, 2, 3, 4, 5], &is_even) #== [2, 4]

is_positive = Proc.new { |n| n > 0 }
p selective_map([1, -2, 0, 4, -5], &is_positive) #== [1, 4]

# contains_a = Proc.new { |word| word.include?('a') }
# p selective_map(%w(apple banana orange grape), contains_a) #== %w(apple banana orange grape)

# longer_than_3 = Proc.new { |word| word.length > 3 }
# p selective_map(%w(cat dog fish bird), longer_than_3) #== %w(fish bird)
