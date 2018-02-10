# N-Parasitic numbers ending in N - 3Kyu

ALPHABET = (("0".."9").zip(0..9) + ("a".."z").zip(10..35)).to_h
def calc(last,base,a=0,b=last,c=last,d=[],string=[ALPHABET.invert[last]])
  if a == 0 && c == 1
   return string.join
  end
  num = (a + b*c).to_s(base)
  d = pad(num).chars
  c= d.pop
  a = ALPHABET[d.shift]
  string.unshift(c)
  c = ALPHABET[c]
  calc(last,base,a,b,c,d,string)
end

def pad(num)
  if num.length == 1
   return "0#{num}"
  else
    return "#{num}"
  end
end
