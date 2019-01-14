# Counting 1-BITS
# know more: https://www.geeksforgeeks.org/count-set-bits-in-an-integer/

# This algorithm uses the Ruby’s Bitwise Operators & and >>: https://www.calleerlandsson.com/posts/rubys-bitwise-operators/

# 1. The bitwise AND operator (&) compares the binary representation of two integers bit by bit;
# if the same bits in both integers are set to 1 the resulting integer’s binary representation will have the corresponding bit set to 1.
# If not, the bit will be set to 0.

# 2. The bitwise left and right shift operators (<< or >>) shift the bits of an integer’s binary representation to the left or right by the given number of positions,
# padding with zeros or truncating bits as necessary

# So we can work like so, to check about the presence of 1 in 2 for example: 2 & 1 => 0 then (2-1) & 1 => 1, there is one 1 in 2

def counting_1bits(value)
  count = 0

  while value > 0
    count += value & 1
    value >>= 1
  end

  count
end

puts counting_1bits(0)
# 0

puts counting_1bits(1)
# 1

puts counting_1bits(6)
# 2
