require 'yaml'

arr = Array.new
items = Array.new

class MyError < RuntimeError; end
 
raise MyError.new "ERROR! File doesn't exsists : #{ARGV[0]}" unless File.exist? ARGV[0]

begin
if ARGV.length == 2
	data 	= YAML.load_file(ARGV[0])
	environment = ARGV[1]
else
	raise MyError.new "Invalid arguments specified\nUsage : sample.rb <cfg YAML file> [option]"
end

data.each {|key, val| items.push key }
raise MyError.new "ERROR! Invalid option : #{ARGV[1]}" unless items.include?(ARGV[1])

# オプション無し
data.each do |key, value|
	raise MyError.new  "ERROR! the key exists : #{key}" unless ENV[key].nil?
	arr.push "#{key}=#{value}" unless value.instance_of?(Hash)
end
	
# オプションあり
if data.has_key?(environment)	
	data[environment].each do |key, value|
		raise MyError.new  "ERROR! the key exists : #{key}" unless ENV[key].nil?
		arr.push "#{key}=#{value}"
	end
end

puts arr

rescue SystemExit => e
  if e.instance_of? MyError
    puts "#{e}(MyError)"
  else
    puts e
  end
end
