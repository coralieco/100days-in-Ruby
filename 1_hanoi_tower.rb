# Hanoi Tower
# know more: https://en.wikipedia.org/wiki/Tower_of_Hanoi

def hanoi_tower(n, source = 'A', destination = 'B', auxiliary = 'C')
  return unless n

  if n == 1
    puts "Move from #{source} to #{destination}"
  else
    # Step 1 − Move n-1 disks from source to aux
    hanoi_tower(n-1, source, auxiliary, destination)
    #
    # # Step 2 − Move nth disk from source to dest
    puts "Move from #{source} to #{destination}"
    # destination.push(source.pop)
    #
    # # Step 3 − Move n-1 disks from aux to dest
    hanoi_tower(n-1, auxiliary, destination, source)
    # puts "Move from #{auxiliary} to #{destination}"
  end
end

hanoi_tower(1)
# Move from A to B

hanoi_tower(2)
# Move from A to C
# Move from A to B
# Move from C to B

# What it does when n == 2:
# it calls `hanoi_tower(1, source, auxiliary, destination)`
# but as n==1, it puts "Move from #{source} to #{destination}"
# so: Move from A to C
# then it puts "Move from #{source} to #{destination}"
# so: Move from A to B
# then it calls `hanoi_tower(1, auxiliary, destination, source)` (parameters are in different order)
# so: Move from C to B

hanoi_tower(3)
# Move from A to B
# Move from A to C
# Move from B to C
# Move from A to B
# Move from C to A
# Move from C to B
# Move from A to B
