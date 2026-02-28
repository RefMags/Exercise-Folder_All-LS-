class TextAnalyzer
  def process
    content = File.read('sample_text.txt')
    # content = File.open('sample_text.txt', 'r')
    yield(content) # pass contents of the file to the block.
    # content.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(" ").count} words" }
