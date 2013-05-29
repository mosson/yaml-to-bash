require 'yaml'

data 	= YAML.load_file(ARGV[0])
file		= open(ARGV[1], "a")
options = ["development", "test", "bench", "staging", "production"]

data.each do |datum|
	if datum[0] != "development" && datum[0] != "test" && datum[0] != "bench" && datum[0] != "staging" && datum[0] != "production"	
			file.puts datum[0] + "=" + data[datum[0]]
	else
		options.each do |option|
			if datum[0][option] == ARGV[2]
				for hash in data[option]
					file.puts hash[0] + "=" + hash[1]
				end
			end			
		end
	end		
end
file.close
