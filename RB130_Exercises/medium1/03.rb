snacks = ['scones', 'flapjack']

def a_method
  puts "Is a_method in the binding or inside?"
end

[1,2, 3].each do |_|
  puts snacks
  a_method
  b_method
end

def b_method
  puts "Is b_method in the binding or inside?"
end
