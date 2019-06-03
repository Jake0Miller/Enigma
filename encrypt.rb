require './lib/enigma'

input, output = ARGV

ans = Enigma.new.encrypt(File.read("data/#{input}").chomp)
File.write("data/#{output}", "#{ans[:encryption]}")

puts "Created #{output} with the key #{ans[:key]} and date #{ans[:date]}"
