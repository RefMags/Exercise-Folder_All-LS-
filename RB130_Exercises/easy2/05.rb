# original solution

def drop_while(arr)
  arr.each_with_index.with_object([]) do |(ele, idx), new_arr|
    # if ele is false; we have to break/return immediately;
# the condition : by taking the ele, and the rest of the element into the new object
    if !yield(ele)
      new_size = arr.size - 1
      new_arr << arr.values_at(idx..new_size)
      return new_arr.flatten
    end
  end
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []


=begin
while this method works, it doesnt match the spec.
  - in the test case for `[]` we only get the results as a side effect not intent
  because `!yield(ele)` is never triggered.
  - similarly, when `[]` is passed as an argument then also get a side effect, not
  because its never ran.
  - the code show potential slice bug.

  A simplier structure is to:
  - track the index
  - move the index forward while the block returns truthy
  - return the "rest" of the array starting at that index

  # so alternative is to use `while` loop.
  #
  1. Avoid the `values_at` range
  - it is only ever meant for pulling specific positions/ranges
=end

def drop_while(array)
  index = 0

  while index < array.size && yield(array[index]) # the body of the `while` loop
    # runs as along as both sub-conditions are false, if either is false or nil
    # the loop terminates.
    # **short-circuit** logic.
    index += 1
  end

  array[index..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } #== [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []
