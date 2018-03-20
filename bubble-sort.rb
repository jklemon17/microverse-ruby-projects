array = [7,6,12,4,3,45,1]

# indexL = 0
# indexR = 1
# we want indexL and R to not be fined outside the function,
# but to start them off with initial values of 0 and we ,
# we give them default values

def bubbleSort(array, indexL=0, indexR=1, swapped=false)

# swapped = false  # given default in first line, same as for the indexes

  # check if left > right (which is wrong)?
  if array[indexL] > array[indexR]
    # wrong so swap them
    array[indexL], array[indexR] = array[indexR], array[indexL]
    swapped = true
  end

  indexL += 1
  indexR += 1
  # run function again

  # keep going be calling this recursively again until the right most value,
  # for one complete pass
  if indexR < array.length
      bubbleSort(array, indexL, indexR, swapped)

  else    #indexR == array.length
  # check if already sorted,
  # it is not if swapped == true
  # if swapped == false, then done, return the array
    if swapped == false
      return array
    else
      # # reset the indexes:
      # indexL = 0
      # indexR = 1
      # NO NEED TO RESET because if you don't pass anything,
      # they will be set to their default values
      # that we defined in the first line of the function


      # restart
      bubbleSort(array)
    end
  end

end


bubbleSort(array)
