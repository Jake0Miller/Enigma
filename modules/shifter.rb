# module Shifter
#   def shifter(key, date)
#     date_shift = ((date.to_i)**2).to_s[-4..-1]
#     (0..3).each_with_object([]) do |num,arr|
#       arr << key[num..num+1].to_i + date_shift[num].to_i
#     end
#   end
# end
