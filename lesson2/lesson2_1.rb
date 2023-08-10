=begin
1. Сделать хеш, содержащий месяцы и количество дней в месяце. В цикле выводить те месяцы, у которых количество дней ровно 30
=end

hash = { "January" => 31, "February" => 28, "March" => 31, "April" => 30, "May" => 31, "June" => 30, "July" => 31, "August" => 31, "September" => 30, "October" => 31, "November" => 3, "December" => 31}

hash.each do |key, value| 
  puts key if value == 30
end

=begin
2. Заполнить массив числами от 10 до 100 с шагом 5
=end

arr = []
index = 10
while index <= 100 do
  arr << index
  index += 5
end
puts arr

=begin
3. Заполнить массив числами фибоначчи до 100
=end

fibonachi = [0, 1]
index = 1
loop do 
  index += 1
  fibonachi_next = fibonachi[index-1] + fibonachi[index-2]
  break if fibonachi_next > 100
  fibonachi << fibonachi_next 
end
puts fibonachi 

=begin
4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
=end

vowels = 'aeiou'
letters = ('a'..'z').to_a
hash = {}

letters.each_with_index do |letter, index|  
  hash[letter] = index + 1 if vowels.include? letter 
end
puts hash

