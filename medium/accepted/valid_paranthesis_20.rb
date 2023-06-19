# Problem 20: Valid Parentheses
# https://leetcode.com/problems/valid-parentheses/

# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
#
# An input string is valid if:
#
#     Open brackets must be closed by the same type of brackets.
#     Open brackets must be closed in the correct order.
#     Every close bracket has a corresponding open bracket of the same type.
#
#
#
# Example 1:
#
# Input: s = "()"
# Output: true
#
# Example 2:
#
# Input: s = "()[]{}"
# Output: true
#
# Example 3:
#
# Input: s = "(]"
# Output: false
#
#
#
# Constraints:
#
#     1 <= s.length <= 104
#     s consists of parentheses only '()[]{}'.


def matching?(o, c)
  @matches ||= {
    "(" => ")",
    "{" => "}",
    "[" => "]",
    # these are not needed here, since we will only match
    # "}" => "{",
    # ")" => "(",
    # "]" => "{",
  }

  @matches[o] == c
end

# @param {String} s
# @return {Boolean}
def is_valid(s)
  # if encounter opening parenthesis, push it
  # if encounter closing:
  #   - peek at the last push
  #   - if matching, pop, move on
  #   - if not matching -- break, it's invalid
  stack = []
  all_matching = true
  opening_chars = /[({\[]/i
  closing_chars = /[)}\]]/i

  # just a convenient alias
  def stack.peek
    self[-1]
  end

  s.each_char do |paren|
    case paren
    when opening_chars
      stack.push(paren)
    when closing_chars
      top = stack.peek

      if matching?(top, paren)
        stack.pop
      else
        all_matching = false
        break
      end
    else
      next
    end
  end

  stack.length == 0 && all_matching # all pushed have been popped
end
