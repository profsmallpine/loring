namespace :data do
  desc 'Build data file from txt document'
  task extract: :environment do
    id = 1
    closing_hash = false

    File.open('app/lib/parsed_data.txt', 'w') do |output|
      File.open('app/lib/data.txt', 'r') do |input|
        input.each_line do |line|
          # Line is category if it starts with an x
          if line.start_with?('x')
            if closing_hash
              output.write("],\n")
            else
              closing_hash = true
            end

            output.write("\'#{line.chomp[1..-1]}\': [\n")
          # Line is video url if it starts with 'https'
          elsif line.start_with?('https')
            output.write("    url: #{line.chomp}\n")
            output.write("  },\n")
          # Line is video name if it is not empty
          elsif line != "\n"
            output.write("  {\n")
            output.write("    id: #{id},\n")
            output.write("    name: #{line.chomp},\n")
            id += 1
          end
        end
      end
    end
  end
end
