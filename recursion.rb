# implementation of  https://www.codequizzes.com/computer-science/beginner/recursion
require 'pry-byebug'
def collatz(n, step = 0)
  return step if n.eql?(1)
  (n % 2 == 0) ? collatz(n/2, step + 1) : collatz( 3*n + 1, step + 1)
end

def factorial(n)
  return 1 if n.eql?(1)
  n * factorial(n - 1)
end

def check_palindrome(string)
  if string.length == 1 || string.length == 0
    true
  else
    if string[0] == string[-1]
      palindrome(string[1..-2])
    else
      false
    end
  end
end

def beer_bottles(n)
  if n.eql?(0)
    puts "no more bottles of beer on the wall" 
    return
  end
  puts "#{n} bottle#{n>1 ? 's' : '' } of beer on the wall"
  beer_bottles(n-1)
end

def fibonacci_val(n)
  return nil unless n.positive?
  case n
  when 1
    return 0
  when 2 
    return 1
  else
  return fibonacci_val(n-1) + fibonacci_val(n-2)
  end
end

def flatten_array(arr, ret_val = [])
  arr.each do |e|
    if e.is_a?(Array)
      flatten_array(e, ret_val)
    else
       ret_val << e
    end
  end
  ret_val
end

def integer_to_roman(number, result = "")
  roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
  }
  return result if number == 0
  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return integer_to_roman( modulus, result) if quotient > 0
  end
end

def roman_to_integer(str, result = 0)
  roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
  }
  return result if str.empty?
  roman_mapping.keys.each do |roman|
    if str.start_with?(roman)
      result += roman_mapping[roman]
      str = str.slice(roman.length, str.length)
      return roman_to_integer(str, result)
    end
  end
end


puts collatz(27) # 111
puts factorial(5) # 120
puts check_palindrome("malayalam")
puts check_palindrome("jarrasj")
beer_bottles(7)
puts fibonacci_val(0) #nil
puts fibonacci_val(2) #1
puts fibonacci_val(7) #8
puts fibonacci_val(15) #377
puts flatten_array( [[1, [8, 9]], [3, 4]] )
puts flatten_array( [[1, 2], [3, 4]] )
puts integer_to_roman(14)
puts roman_to_integer("IV")
puts roman_to_integer("MCLXCVI")
