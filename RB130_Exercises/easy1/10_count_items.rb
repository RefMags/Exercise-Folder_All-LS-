def count(collection)
  # a variable to keep track of true
  count_for_true = 0

  collection.each do |ele|
    count_for_true += 1 if yield(ele)
  end

  count_for_true
end


puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2
