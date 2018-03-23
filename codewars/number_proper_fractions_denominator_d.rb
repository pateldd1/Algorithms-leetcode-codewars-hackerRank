require 'prime'
def proper_fractions(n)
  divisors_hash = {}
  divisors(n).each do |divisor|
    divisors_hash[divisor] = (n - 1)/divisor
  end
  divisors_hash.each do |divisor,mult|
    divisors(divisor).each do |d|
      divisors_hash[d] -= mult
    end
  end
  cant_be = 0
  divisors_hash.each do |divisor,mult|
    cant_be += mult
  end
  n - 1 - cant_be
end

def divisors(num)
  arr = []
  start = Math.sqrt(num).to_i
  start.downto(2) do |fac|
    if num%fac == 0
      arr.push(fac)
      arr.unshift(num/fac) unless num/fac == fac
    end
  end
  arr
end