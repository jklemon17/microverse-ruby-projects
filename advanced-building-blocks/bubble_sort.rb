array = [7, 6, 12, 4, 3, 45, 1]

# index = 0
# we want index to not be defined outside the function,
# but to start them off with initial values of 0 and we ,
# we give them default values

def bubble_sort(array, index=0, swapped=false)

# swapped = false  # given default in first line, same as for the indexes

  # check if left > right (which is wrong)?
  if array[index] > array[index + 1]
    # wrong so swap them
    array[index], array[index + 1] = array[index + 1], array[index]
    swapped = true
  end

  index += 1
  # run function again

  # keep going be calling this recursively again until the right most value,
  # for one complete pass
  if index + 1 < array.length
      bubble_sort(array, index, swapped)

  else    #index + 1 == array.length
  # check if already sorted,
  # it is not if swapped == true
  # if swapped == false, then done, return the array
    if swapped == false
      return array
    else
      # # reset the indexes:
      # index = 0
      # NO NEED TO RESET because if you don't pass anything,
      # they will be set to their default values
      # that we defined in the first line of the function


      # restart
      bubble_sort(array)
    end
  end

end

p bubble_sort(array)

def bubble_sort_by(array, index=0, swapped=false, &block)

  # swapped = false  # given default in first line, same as for the indexes

    # check if left > right (which is wrong)?
    if block.call(array[index], array[index + 1]) > 0
      # wrong so swap them
      array[index], array[index + 1] = array[index + 1], array[index]
      swapped = true
    end

    index += 1
    # run function again
    # keep going be calling this recursively again until the right most value,
    # for one complete pass
    if index + 1 < array.length
      bubble_sort_by(array, index, swapped, &block)

    elsif swapped == false    # && index + 1 == array.length
    # check if already sorted,
    # it is not if swapped == true
    # if swapped == false, then done, return the array
      return array
    else
        # # reset the indexes:
        # index = 0
        # NO NEED TO RESET because if you don't pass anything,
        # they will be set to their default values
        # that we defined in the first line of the function


        # restart
        bubble_sort_by(array, &block)
    end

end

# Blocks must be passed to methods outside of the argument parentheses
array_sorted = bubble_sort_by(["hi","hello","hey"]) do |left,right|
  right.length - left.length
end

p array_sorted
