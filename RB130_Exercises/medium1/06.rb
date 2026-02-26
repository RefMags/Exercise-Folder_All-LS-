=begin
class Demo
  def initialize(n)
    @iv = n
  end
  def hello()
    "Hello, @iv = #{@iv}"
  end
end

k = Demo.new(99)
m = k.method(:hello)
p m.call   #=> "Hello, @iv = 99"

l = Demo.new('Fred')
m = l.method("hello")
p m.call

# [ 1, 2, 3 ].each(&method(:puts))

out = File.open('test.txt', 'w')
[ 1, 2, 3 ].each(&out.method(:puts))
=end
