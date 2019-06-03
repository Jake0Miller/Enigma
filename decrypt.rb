require './lib/enigma'

input, output, key, date = ARGV

ans = Enigma.new.decrypt(File.read("data/#{input}").chomp, key, date)
File.write("data/#{output}", "#{ans[:decryption]}")

puts "Created #{output} with the key #{ans[:key]} and date #{ans[:date]}"
