# 2Kyu - Evaluate Mathematical Expression

def evaluate(string)
    string = string.gsub("++","+")
    nums = string.scan(/[-]?[0-9]*\.?[0-9]*/)
    nums.delete("")
    nums = nums.map(&:to_f)
    ops = string.scan(/[\/*+]/)
    if ops.size == 0
      return string
    end
    arr = []
    arr.push(nums[0],ops[0],nums[1])
    (1..ops.length-1).each do |index|
      arr.push(ops[index],nums[index+1])
    end
  while !(["/","*"] & arr).empty?
    i = arr.find_index {|val| val == "*" || val == "/"}
    case arr[i]
      when "*"
        arr[i-1..i+1] = arr[i-1]*arr[i+1].to_f
      when "/"
        # return nil if arr[i+1].to_f == 0
        arr[i-1..i+1] = arr[i-1]/arr[i+1].to_f
    end
  end
  while arr.include?("+")
    i = arr.find_index {|val| val == "+"}
    if arr[i] == "+"
        arr[i-1..i+1] = arr[i-1]+arr[i+1].to_f
    end
  end
  arr[0].to_s
end


def calc(expression)
  expression = expression.gsub(" ","").gsub("--","+")
  characters = expression.chars
  expression = characters.map.with_index do |char,inx|
    if inx == 0
      char
    elsif char == "-" && !characters[inx-1].match(/[\*\/\+(]/)
      "+-"
    else
      char
    end
  end.join
  p expression
  return calculate(expression).to_f
end

def calculate(expression)
  i = 0
  parentheses = Hash.new(0)
  start = nil
  finish = nil
  while i < expression.length
    if expression[i] == "("
      start = i if !start
      parentheses["("] += 1
    elsif expression [i] == ")"
      parentheses[")"] += 1
    end
    if parentheses["("] == parentheses[")"] && parentheses[")"] > 0
      finish = i
      x = calculate(expression[start+1...finish])
      # return nil if !x
      expression[start..finish] = x
      i -= (finish-start)
      parentheses = Hash.new(0)
      start = nil
      finish = nil
    else
      i += 1
    end
  end
  expression = expression.gsub(" ","").gsub("--","+")
  characters = expression.chars
  expression = characters.map.with_index do |char,inx|
    if inx == 0
      char
    elsif char == "-" && !characters[inx-1].match(/[\*\/\+(]/)
      "+-"
    else
      char
    end
  end.join
  y = evaluate(expression)
  # return nil if !y
  return y
end
