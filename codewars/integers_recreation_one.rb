require 'prime'
def list_squared(m, n)
 answer = []  
    (m..n).each do |num| 
      v = Math.sqrt((divisors(num).reduce(:+))**2 - combination_sum(num)).to_f
      if v.to_f == v.to_i
        answer << [num,(v**2).to_i]
      end
    end
 answer     
end

def combination_sum(z)
 2*divisors(z).combination(2).to_a.reduce(0) {|acc,subarr| acc + subarr.reduce(:*)}
end
def divisors(z)
arr = []
  start = Math.sqrt(z).to_i
  start.downto(1) do |fac|
    if z%fac == 0
      arr.unshift(fac)
      arr.push(z/fac) unless z/fac == fac
    end
  end
  arr
end