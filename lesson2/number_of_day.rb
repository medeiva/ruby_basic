puts "Input day"
day = gets.chomp.to_i
puts "Input month"
month = gets.chomp.downcase.capitalize
puts "Input year"
year = gets.chomp.to_i

months = { "January" => 31, "February" => 28, "March" => 31, "April" => 30, "May" => 31, "June" => 30, "July" => 31, "August" => 31, "September" => 30, "October" => 31, "November" => 3, "December" => 31}
number_day = 0

leap_year = false
leap_year =
  if year % 4 == 0
    if year % 100 == 0
  	  year % 400 == 0
    else
    	leap_year = true
    end
  end

months.each do |key, value|
  number_day += 1 if key == "February" && leap_year
  break if key == month
  number_day += value 
end

number_day += day

puts number_day

