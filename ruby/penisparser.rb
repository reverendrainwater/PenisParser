puts "naame of file: "
filename = gets
text = File.open(filename.chomp, "r+").read
_penis = "penis"
_count = 0
text.each_char do |line|
   if _count % 5 == 0

    _count += 1
