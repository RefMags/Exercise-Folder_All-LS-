class TextAnalyzer
  def process
    content = File.read('server_log.txt')
    yield(content) # pass contents of the file to the block.
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n").count} total log entries" }

analyzer.process do |text|
  # we want to go through each line, and check if it includes 'ERROR'
  lines = text.split("\n")
  error_line = lines.count { |line| line.include?('ERROR')}
  puts "#{error_line} ERROR entries"
end

analyzer.process do |text|
  # we want to go through each line, and check if it includes 'WARN'
  lines = text.split("\n")
  warn_line = lines.count { |line| line.include?('WARN')}
  puts "#{warn_line} WARN entries"
end
