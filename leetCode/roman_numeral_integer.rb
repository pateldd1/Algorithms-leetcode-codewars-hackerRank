def int_to_roman(num)
    hash = {"I" => 1, "IV" => 4, "V" => 5, "IX" => 9, 
        "X" => 10, "XL" => 40, "L" => 50, 
        "XC" => 90, "C" => 100, "CD" => 400, 
        "D" => 500, "CM" => 900, "M" => 1000}
    str = ""
    hash.to_a.reverse.each do |roman, decimal|
        while num / decimal != 0
            str += roman
            num -= decimal
        end
    end
    str
end