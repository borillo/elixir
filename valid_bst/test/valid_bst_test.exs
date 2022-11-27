defmodule ValidBstTest do
  use ExUnit.Case
  test "reads number and problem" do
    assert Solution.readNumber() == 5
    assert Solution.readProblem() == [1, 2, 3]
  end
  test "empty traversal" do
    assert Solution.is_bst([]) == true
  end
  test "singleton traversal" do
    assert Solution.is_bst([1]) == true
  end
  test "right" do
    assert Solution.is_bst([1,2,3]) == true
    assert Solution.is_bst([2,1,3]) == true
    assert Solution.is_bst([3,2,1,5,4,6]) == true
  end
  test "wrong" do
    assert Solution.is_bst([1,3,4,2]) == false
    assert Solution.is_bst([3,4,5,1,2]) == false
  end
end
