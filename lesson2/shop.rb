hash = {}
loop do 
  puts "Input product"
  product = gets.chomp.downcase
  break if product == "stop"
  
  puts "Input unit price"
  price = gets.chomp.to_i
  
  puts "Input count"
  count = gets.chomp.to_i

  hash[product] = { price: price, count: count }
end

sum = 0
hash.each do |key, value|	
  product_sum = value[:price] * value[:count]
  sum += product_sum
  puts "product: #{key}, price: #{value[:price] }, count: #{value[:count]}, sum: #{product_sum}"
end

puts "Purchase amount: #{sum}"
