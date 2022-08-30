require 'json'

arr = [1,2,3,4,5,6,7]

to_jason = JSON.generate(arr)

File.open('text.txt', 'a') do |file|
  file.write(to_jason)
end

puts to_jason