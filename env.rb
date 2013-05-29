require 'yaml'


data 	= YAML.load_file(ARGV[0])
options = ["development", "test", "bench", "staging", "production"]



data.each do |datum|
	key = datum[0]
	if datum[0] != "development" && datum[0] != "test" && datum[0] != "bench" && datum[0] != "staging" && datum[0] != "production"	
		if ENV[datum[0]].nil?
			puts datum[0] + "=" + data[datum[0]]			
		else
			puts "ERROR! the key exists : #{datum[0]}"
			break;
		end
	else
		options.each do |option|
			if datum[0][option] == ARGV[2]
				for hash in data[option]
					if ENV[hash[0]].nil?
							puts hash[0] + "=" + hash[1]
						else
							puts "ERROR! the key exists : #{hash[0]}"
							break;
					end
				end
			end			
		end
	end		
end



