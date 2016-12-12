# filename = ARGV.first
puts "naame of file: "
filename = gets
File.open(filename.chomp, "r") do |f|
    puts f.read()
end
