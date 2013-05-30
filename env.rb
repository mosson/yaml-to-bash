require 'yaml'

data 	= YAML.load_file(ARGV[0])
items = Array.new

data.each do |dataKey, dataVal|
	items.push(dataKey) if dataVal.instance_of?(Hash)
	raise "ERROR! the key exists : #{dataKey}" unless ENV[dataKey].nil?
	puts "#{dataKey}=#{dataVal}" if dataVal.instance_of?(String)
	
	if dataVal.instance_of?(Hash)
		if dataKey == ARGV[1]
			dataVal.each do |key, val|								
				raise "ERROR! the key exists : #{key}" unless ENV[key].nil?
				puts "#{key}=#{val}"
			end
		end
	end		 
end

raise "ERROR! No such an option : #{ARGV[1]}" unless items.include?(ARGV[1])




