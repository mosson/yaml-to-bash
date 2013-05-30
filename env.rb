require 'yaml'

data 	= YAML.load_file(ARGV[0])
items = ["development", "test", "bench", "staging", "production"]

data.each do |datum|
	raise "ERROR! the key exists : #{datum[0]}" unless ENV[datum[0]].nil?
	puts "#{datum[0]}=#{datum[1]}" if datum[1].instance_of?(String)
end

items.each do |item|
	raise "No such an option" unless items.include? ARGV[1]
	if item == ARGV[1]
		data[item].each do |hash|
			if ENV[hash[0]].nil?
					puts "#{hash[0]}=#{hash[1]}"
				else
					raise "ERROR! the key exists : #{hash[0]}"
					break;
			end
		end
	end			
end	
