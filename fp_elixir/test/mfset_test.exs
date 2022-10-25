defmodule MFSetTest do
  use ExUnit.Case

  test "Create new maps indexed by position" do
    set = MFSet.mkMFSet(2)

    assert set == %{
             1 => %{parent: 1, size: 1},
             2 => %{parent: 2, size: 1}
           }
  end

  test "Find" do
    set = MFSet.mkMFSet(2)

    assert MFSet.find(set, 2) == 2
  end

  def assertElementsConected(result, e1, e2) do
    assert MFSet.find(result, e1) == MFSet.find(result, e2)
  end

  def assertElementsNotConected(result, e1, e2) do
    assert MFSet.find(result, e1) != MFSet.find(result, e2)
  end

  def assertAllElementsConnected(result) do
    for n <- 1..5 do
      assert MFSet.find(result, 1) == MFSet.find(result, n)
    end
  end

  test "Merge" do
    set = MFSet.mkMFSet(5)
    result = MFSet.merge(set, 1, 3)

    assertElementsConected(result, 1, 3)
    assertElementsNotConected(result, 1, 2)

    result = MFSet.merge(result, 4, 3)
    result = MFSet.merge(result, 5, 2)
    result = MFSet.merge(result, 2, 3)

    assertAllElementsConnected(result)
  end
end
