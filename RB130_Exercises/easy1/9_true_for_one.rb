def one?(collection)
  return false if collection.empty?

  # collection.each { |ele| }
  count = 0

  while count < collection.size do
    el = collection[count]
    yield(el)
    count += 1
  end
end

one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false
