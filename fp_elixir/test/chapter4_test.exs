defmodule RList do
  def fold([], _, dv), do: dv

  def fold([head | rest], cmp, dv) do
    value = fold(rest, cmp, dv)
    cmp.(head, value)
  end

  def max(list) do
    fold(
      list,
      fn x, y ->
        if x > y, do: x, else: y
      end,
      -1000
    )
  end

  def min(list) do
    fold(
      list,
      fn x, y ->
        if x < y, do: x, else: y
      end,
      1000
    )
  end

  def fsum(x, y), do: x + y

  def sum(list) do
    list |> fold(&fsum/2, 0)
  end
end

defmodule GeneralStore do
  def test_data do
    [
      %{title: "Longsword", price: 50, magic: false},
      %{title: "Healing Potion", price: 60, magic: true},
      %{title: "Rope", price: 10, magic: false},
      %{title: "Dragon's Spear", price: 100, magic: true}
    ]
  end

  # def xxx(parm1, val: x) ---> [{:val, x}]

  def filter_items(items, magic: magic_value) do
    RList.fold(
      items,
      fn item, acc ->
        case item do
          %{magic: ^magic_value} -> [item | acc]
          _ -> acc
        end
      end,
      []
    )
  end
end

defmodule Chapter4Test do
  use ExUnit.Case

  test "List recursive operations" do
    assert RList.max([4, 2, 16, 9, 10]) == 16
    assert RList.min([4, 2, 16, 9, 10]) == 2
    assert RList.sum([4, 2, 16]) == 22
  end

  test "Filter magic stuff" do
    result = GeneralStore.filter_items(GeneralStore.test_data(), magic: true)

    assert result == [
             %{title: "Healing Potion", price: 60, magic: true},
             %{title: "Dragon's Spear", price: 100, magic: true}
           ]

    result = GeneralStore.filter_items(GeneralStore.test_data(), magic: false)

    assert result == [
             %{title: "Longsword", price: 50, magic: false},
             %{title: "Rope", price: 10, magic: false}
           ]
  end
end
