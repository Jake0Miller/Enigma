require './lib/enigma'

input, output, key, date = ARGV

enigma = Enigma.new
ans = enigma.decrypt(File.read("data/#{input}").chomp, key, date)
File.write("data/#{output}", "#{ans[:decryption]}")

puts "Created #{output} with the key #{ans[:key]} and date #{ans[:date]}"
