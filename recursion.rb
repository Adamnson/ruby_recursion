# implementation of  https://www.codequizzes.com/computer-science/beginner/recursion

def collatz(n, step = 0)
  return step if n.eql?(1)
  (n % 2 == 0) ? collatz(n/2, step + 1) : collatz( 3*n + 1, step + 1)
end

puts collatz(27) # 111

def factorial(n)
  return 1 if n.eql?(1)
  n * factorial(n - 1)
end

puts factorial(5) # 120

# def check_palindrome(s)
#   if s.length >= 2
#     if s[0] == s[-1] ? true : false
#   elsif s.length == 1 || s.length == 0
#     true
#   end
#   check_palindrome(s[1,s.length-2])
# end

# puts check_palindrome("malayalam")
# puts check_palindrome("jarrasj")


def beer_bottles(n)
  if n.eql?(0)
    puts "no more bottles of beer on the wall" 
    return
  end
  puts "#{n} bottle#{n>1 ? 's' : '' } of beer on the wall"
  beer_bottles(n-1)
end

beer_bottles(7)

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


puts fibonacci_val(0) #nil
puts fibonacci_val(2) #1
puts fibonacci_val(7) #8
puts fibonacci_val(15) #377

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

puts flatten_array( [[1, [8, 9]], [3, 4]] )
puts flatten_array( [[1, 2], [3, 4]] )