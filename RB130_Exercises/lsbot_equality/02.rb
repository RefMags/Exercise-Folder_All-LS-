class Book
  attr_reader :title, :author, :genre

  def initialize(title, author, genre)
    @title = title
    @author = author
    @genre = genre
  end

  def ==(other)
    title == other.title && author == other.author
  end
end

book1 = Book.new("The Catcher in the Rye", "J.D. Salinger", "Fiction")
book2 = Book.new("The Catcher in the Rye", "J.D. Salinger", "Classic")
book3 = Book.new("To Kill a Mockingbird", "Harper Lee", "Fiction")

puts book1 == book2 # Expected: true
puts book1 == book3 # Expected: false
