puts "Введите сторону треугольника:"
a = gets.chomp.to_i
puts "Введите сторону треугольника:"
b = gets.chomp.to_i
puts "Введите сторону треугольника:"
c = gets.chomp.to_i

is_rectangular = false
is_isosceles = a == b || c == b || c == a
is_equilateral = a == b && b == c

if !is_equilateral
  if a > b && a > c
    is_rectangular = (a**2 == b**2 + c**2)
  elsif b > c && b > a
    is_rectangular = (b**2 == a**2 + c**2)
  else 
    is_rectangular = (c**2 == a**2 + b**2)
  end
  puts "треугольник - #{is_rectangular ? 'прямоугольный' : is_isosceles ? 'равнобедренный' : 'никакой'}"
elsif 
  puts "треугольник равнобедренный и равносторонний"
end
