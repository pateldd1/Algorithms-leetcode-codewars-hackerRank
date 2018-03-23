def solution(list)
  list.slice_when {|a,b| a + 1 != b}.to_a.map do |subarr| 
  if subarr.length >= 3
   "#{subarr[0]}-#{subarr[-1]}"
  else
  subarr.join(",")
  end
  end.join(",")
end