# Simplifying Multilinear polynomials - 4Kyu

def simplify(a)
  a = "+" + a unless ["+","-"].include?(a[0])
a = a.chars.map.with_index do |letter,inx|
 if letter == "+" && !a[inx+1].match(/[0-9]/)
  "+1"
 elsif letter == "-" && !a[inx+1].match(/[0-9]/)
  "-1"
 else
  letter
 end
end.join
nums = a.scan(/[+-]\d+/).map(&:to_i)
letters=  a.scan(/[a-z]+/).map(&:chars).map(&:sort).map(&:join)
hash = Hash.new(0)
letters.each_with_index do |str,inx|
  hash[str] += nums[inx]
 end
hash = hash.sort_by{|k,v| k}.to_h
hash = hash.sort_by{|k,v|
 k.length}.to_h
 hash= hash.map do |k,v|
 if v > 1
  "+" + v.to_s + k
 elsif v == 1
  "+" + k
 elsif v == -1
  "-" + k
 elsif v == 0
  ""
 else
  v.to_s + k
 end
end.join
hash[0] = "" if hash[0] == "+"
hash
end
