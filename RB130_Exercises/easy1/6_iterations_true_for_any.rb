def any?(array)
  return false if array.empty?
  count = 0

  # the loop is designed to find a reason to explicitly return `true` and exit earl
  # If the loop finishes, then it never found a reason to return `true`
  # without `false`, `while` expression evaluate to `nil`, the method implicitly
  # returns `nil` and its  a "falsy" value.
  while count < array.size do
    return true if yield(array[count])
    count += 1
  end

  # in the `fall through` case, the method's result must be `false`,
  # therefore we explicitly provide this return value:
  false # I fall into this trap of not including false
end


puts any?([1, 3, 5, 6]) { |value| value.even? } == true
puts any?([1, 3, 5, 7]) { |value| value.even? } == false
puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
puts any?([1, 3, 5, 7]) { |value| true } == true
puts any?([1, 3, 5, 7]) { |value| false } == false
puts any?([]) { |value| true } == false
