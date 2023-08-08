puts "Введите a:"
a = gets.chomp.to_i
puts "Введите b:"
b = gets.chomp.to_i
puts "Введите c:"
c = gets.chomp.to_i

d = b**2 - 4 * a *c

if d < 0 
  puts "Корней нет"
elsif d == 0
  puts "дискриминант - #{d}, корень #{- (b / 2 * a)}"
else 
  sqrt_d = Math.sqrt(d)
  x1 = ((- b +  qrt_d)/ 2 * a)
  x2 = ((- b - sqrt_d)/ 2 * a)
  puts "дискриминант - #{d}, корни-#{x1}, #{x2}"
end
