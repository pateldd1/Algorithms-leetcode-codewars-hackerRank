require 'prime'
def gap(g, m, n)
  range = (m..n).to_a
  range.each_with_index do |val,inx|
    if inx < range.length - g && val.prime? && !prime_in_range?(val+1,val+g) && (val + g).prime? 
      return [val,val+g]
    end
  end
 return nil 
end
def prime_in_range?(start,finish)
  (start...finish).any? {|val| val.prime?}
end