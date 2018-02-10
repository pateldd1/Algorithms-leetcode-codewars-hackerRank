Reverse Polish Notation Calculator - 4Kyu

def calc(expr)
  if expr == ""
    return 0
  end
  operators = ["/","+","-","*"]
  chain = expr.split
until (chain&operators).empty?
  2.upto(chain.length-1) do |inx|
    if operators.include?(chain[inx])
      first_val = chain[inx-2].to_f
      second_val= chain[inx-1].to_f
      chain[inx-2..inx] = opfunction(first_val,second_val,chain[inx])
    break
    end
  end
end
chain[-1].to_f
end
def opfunction(val1,val2,str)
  case str
    when "*"
      val1*val2
    when "/"
      val1/val2
    when "+"
      val1+val2
    when "-"
      val1-val2
  end
end
