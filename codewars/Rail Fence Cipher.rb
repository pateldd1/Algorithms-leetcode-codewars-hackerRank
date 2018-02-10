Rail Fence Cipher - 3Kyu

def encode_rail_fence_cipher(string, num_rails)
  mod_to = (num_rails - 1)*2
  encoded = []
  num = 0
  until num == (mod_to/2) + 1
   encoded += passthrough(string,mod_to,num)
   num += 1
  end
 encoded.join
end

def passthrough(string,mod_to,num)
  arr = []
  letters=string.chars
  letters.each_with_index do
  |letter,inx|
    n = inx % mod_to
    if n == num || n == mod_to - num
     arr << letter
    end
  end
 arr
end

def decode_rail_fence_cipher(string,num_rails)
 mod_to = (num_rails-1)*2
 letters = string.chars
 arr = Array.new(string.size)
 num = 0
 until letters.empty?
  arr.each_with_index do |space,inx|
  n = inx % mod_to
   if n == num || n == mod_to - num
    arr[inx] = letters.shift
   end
  end
  num += 1
 end
 arr.join
end
