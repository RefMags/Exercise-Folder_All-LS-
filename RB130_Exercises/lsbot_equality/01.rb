class Person
 attr_accessor :name

 def initialize(name)
  @name = name
 end
end

person1 = Person.new("Bob")
person2 = Person.new("Bob")

puts person1 == person2
