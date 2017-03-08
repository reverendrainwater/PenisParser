puts "name of file: "
filename = gets
data = File.read(filename.chomp)
filtered_data = data.gsub(/\w+/, "penis")

File.open(filename.chomp , "w") do |f|
    f.write(filtered_data)
end

