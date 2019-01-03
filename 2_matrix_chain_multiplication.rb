# Matrix chain multiplication
# know more: https://en.wikipedia.org/wiki/Matrix_chain_multiplication
# [Good course in french] https://www.di.ens.fr/~busic/cours/LI325/coursCAAC5_1112.pdf

class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
end

def matrix_chain_multiplication(dim, i, j)
  # case when there is only one matrix: one matrix can't be multiplied
  return min = 0 if j <= i + 1

  # temporary minimum value
  min = Integer::MAX

  # iteration to cover all the parenthesis positions
  # (A[k]) x (A[k+1] x ... x A[J])
  # (A[k] x A[k+1]) x (A[k+2]...A[J])
  # ....
  for k in (i+1...j) do
    # recursion to get all the (i x k) matrices
    cost = matrix_chain_multiplication(dim, i, k)

    # recursion to get all the (k x j) matrices
    cost += matrix_chain_multiplication(dim, k, j)

    # cost to multiply (i x k) x (k x j) matrices
    cost += dim[i] * dim[k] * dim[j]

    if cost < min
      # minimum found over iteration
      min = cost
    end
  end

  return min
end

# Input is a (10 × 30) matrix, a (30 × 5) matrix, and a (5 × 60) matrix
# The product of matrices are defined as we can multiply them:
# - the number of columns in the first matrix matches the number of rows in the second (10 × 30) (30 × 5) => 30
# - the number of columns in the second matrix matches the number of rows in the third (30 × 5) (5 × 60) => 5
dim = [10, 30, 5, 60]
n = dim.size

# Why do we expect 4500 operation ?
# (AB)C = (10×30×5) + (10×5×60) = 1500 + 3000 = 4500 operations
# A(BC) = (30×5×60) + (10×30×60) = 9000 + 18000 = 27000 operations.
puts matrix_chain_multiplication(dim, 0, n-1)
# 4500
