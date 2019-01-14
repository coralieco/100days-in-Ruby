# Heap's algorithm
# know more: https://en.wikipedia.org/wiki/Heap%27s_algorithm

def permutation(array, n)
  return p array if n == 1

  for i in (0..n-1) do
    permutation(array, n-1)

    if n.even?
      array[i], array[n-1] = array[n-1], array[i]
    else
      array[0], array[n-1] = array[n-1], array[0]
    end
  end
end

# Input
array = [1, 2, 3]
n = array.size

permutation(array, n)

# Output
# [1, 2, 3]
# [2, 1, 3]
# [3, 1, 2]
# [1, 3, 2]
# [2, 3, 1]
# [3, 2, 1]

# In Ruby, this can be simply solved with the permutation method like so:
# a = [1, 2, 3]
# a.permutation.to_a
# => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
# But that would be cheating for this exercice :)
