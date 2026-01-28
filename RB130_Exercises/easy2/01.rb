
# step(1, 10, 3) { |value| puts "value = #{value}" }

a = []
('a'..'e').step { |ele| a.push(ele) }
p a
