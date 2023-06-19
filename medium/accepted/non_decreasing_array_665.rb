# Problem 665 Non-decreasing Array
# https://leetcode.com/problems/non-decreasing-array/

# Given an array nums with n integers, your task is to check
# if it could become non-decreasing by modifying at most one element.
#
# We define an array is non-decreasing
# if nums[i] <= nums[i + 1] holds for every i (0-based) such that (0 <= i <= n - 2).
#
#
#
# Example 1:
#
# Input: nums = [4,2,3]
# Output: true
# Explanation: You could modify the first 4 to 1 to get a non-decreasing array.
#
# Example 2:
#
# Input: nums = [4,2,1]
# Output: false
# Explanation: You cannot get a non-decreasing array by modifying at most one element.
#
#
#
# Constraints:
#
#     n == nums.length
#     1 <= n <= 104
#     -105 <= nums[i] <= 105
#
#
# https://leetcode.com/problems/non-decreasing-array/

#   a   b   c   d (c-a) (d-b) | Solvable?
#  50  60   1   2   -49   -58 | N
#   1  10   1   2     0    -8 | Y
#  50  60   1  70   -49    10 | Y
#   1  60   1  70     0    10 | Y
def solvable_dip?(nums, i)
  a = nums[i - 2]
  b = nums[i - 1]
  c = nums[i]
  d = nums[i + 1]

  (a < 0 || d >= nums.length || c - a >= 0 || d - b >= 0)
end

# @param {Integer[]} nums
# @return {Boolean}
def check_possibility(nums)
  return true if nums.length <= 2
  dips = 0
  solvable = true
  # only 1 dip
  # it's solvable
  nums.each_with_index do |num, i|
    next if i == 0

    if num - nums[i - 1] < 0 # there's a dip
      dips += 1

      if dips > 1
        solvable = false
        break
      end

      solvable = solvable_dip?(nums, i)
    end
  end

  solvable && dips <= 1
end


