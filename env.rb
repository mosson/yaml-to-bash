require 'yaml'

datas 	= YAML.load_file("application.yml")
file		= open(".bash_profile", "a")
options = ["development", "test", "bench", "staging", "production"]

for data in datas
	if data[0] != "development" && data[0] != "test" && data[0] != "bench" && data[0] != "staging" && data[0] != "production"	
			file.puts data[0] + "=" + datas[data[0]]
	else
		options.each do |option|
			if data[0][option] == ARGV[0]
				for hash in datas[option]
					file.puts hash[0] + "=" + hash[1]
				end
			end			
		end
	end		
end
file.close
