require './lib/enigma'
require './lib/cracker'
require './lib/key_cracker'

input, out, date = ARGV

ans = Enigma.new.crack(File.read("data/#{input}").chomp, date)
File.write("data/#{out}", "#{ans[:decryption]}")

puts "Created #{out} with the cracked key #{ans[:key]} and date #{ans[:date]}"
