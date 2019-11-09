require "byebug"

##PHASE I

def my_min(list)
  list.each do |el_1|
    return el_1 if list.all? { |el_2| el_1 <= el_2 }
  end
end

## O(n^2)

##PHASE II

def my_min_2(list)
  smallest = list[0]
  list.drop(1).each do |el_1|
    smallest = el_1 if el_1 < smallest 
  end
  smallest
end

## O(n)

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5
# p my_min_2(list)  # =>  -5

## PHASE I

def sub_sum(arr)
  subs = []
  arr.each_with_index do |el1, i1|
    arr.each_with_index do |el2, i2|
      subs << arr[i1..i2] if i2 >= i1
    end
  end
  subs.map(&:sum).max
end

# def better_sub_sum(arr)
#   max_sum = arr.first
#   curr_sum = 0
#   i = 1
#   while i < arr.length
#     # debugger
#     next_ele = arr[i]
#     curr_sum += next_ele
#     # check 1: is entire streak > than curr max
#     # debugger
#     if max_sum + curr_sum >= max_sum
#       max_sum += curr_sum
#       curr_sum = 0
#     else  
#       curr_sum = 0
#     end
#     if next_ele > max_sum
#       max_sum = next_ele
#       curr_sum = 0
#     end
#     i += 1
#   end
#   max_sum
# end

## couldn't use array, because that increased space complexity to O(n), and 
## array.sum increased time complexity to O(n^2). 

def better_sub_sum(arr)
  max = arr.first
  curr_sum = arr.first
  i = 1
  while i < arr.length
    # debugger
    next_ele = arr[i]
    if next_ele > max
      max = next_ele
    end

    curr_sum += next_ele
    if curr_sum >= 0
      if curr_sum > max
        max = curr_sum
      end
    else
      curr_sum = 0
    end
    i += 1
  end
  max
end

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7, -9, -2, 5, 10] # 15
list3 = [-5, -1, -3, 5]
# p sub_sum(list)
# p better_sub_sum(list1)
# p better_sub_sum(list2)
# p better_sub_sum(list3)

def first_anagram?(str_1, str_2)
  perms = str_1.chars.permutation.to_a
  perms.map! { |perm| perm.join("") }
  perms.include?(str_2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str_1, str_2)
  str_1.each_char do |char|
    return false if !str_1.include?(str_2[0])
    str_2.chars.delete_at(str_2.index(char))
  end
  true
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true