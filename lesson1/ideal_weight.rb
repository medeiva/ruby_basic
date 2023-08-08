puts "Как вас зовут?"
name = gets.chomp
puts "Какой ваш рост?"
height = gets.chomp.to_i
ideal_weight = (height - 110) * 1.15
if ideal_weight < 0 
	puts "Ваш вес уже оптимальный"
else
	puts "#{name}, ваш идеальный вес - #{ideal_weight}!"
end
