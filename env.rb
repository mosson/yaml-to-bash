require 'yaml'

arr = Array.new
items = Array.new

begin
if ARGV.length == 2
	data 	= YAML.load_file(ARGV[0])
	environment = ARGV[1]
else
	raise "Invalid arguments specified\nUsage : sample.rb <cfg YAML file> [option]"	
end

data.each {|key, val| items.push key }
raise "ERROR! Invalid option : #{ARGV[1]}" unless items.include?(ARGV[1])

# オプション無し
data.each do |key, value|
	raise "ERROR! the key exists : #{key}" unless ENV[key].nil?
	arr.push "#{key}=#{value}" unless value.instance_of?(Hash)
end
	
# オプションあり
if data.has_key?(environment)	
	data[environment].each do |key, value|
		raise "ERROR! the key exists : #{key}" unless ENV[key].nil?
		arr.push "#{key}=#{value}"
	end
end

puts arr

rescue SystemExit => e
	puts e
end