# Base Conversion - 4Kyu
def convert(input, source, target)
  source_hash = Hash.new
  target_hash = Hash.new
  source_base = source.length
  target_base = target.length
    source.chars.each_with_index do |val,inx|
      source_hash[val] = inx
    end
    target.chars.each_with_index do |val,inx|
      target_hash[inx] = val
    end
    decimal = to_base_10(input,source_base,source_hash)
    if decimal == 0
      return "a"
    end
    final_power = (Math.log(decimal)/Math.log(target_base)).to_i
    answer = []
    final_power.downto(0) do |exponent|
      answer << target_hash[((decimal) / (target_base**exponent)) % target_base]
    end
    answer.join
end

def to_base_10(number,from_base,base_hash)
  number.to_s.reverse.chars.each.with_index.reduce(0) {|acc,(val,inx)| acc + base_hash[val]*(from_base**(inx))}
end
