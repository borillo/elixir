defmodule Chapter2Test do
  use ExUnit.Case
  doctest Chapter2

  test "total prices of goods" do
    bread_slices = 10
    bread_slice_price = 10
    bottles_of_milk = 3
    bottle_of_milk_price = 2
    cakes = 1
    cake_price = 15

    result =
      Chapter2.total_price_goods(
        bread_slices,
        bread_slice_price,
        bottles_of_milk,
        bottle_of_milk_price,
        cakes,
        cake_price
      )

    assert result == 121
  end

  test "distance traveled by bob" do
    result = Chapter2.distance_traveled(200, 4)

    assert result == "Bob has traveled 200km, in 4h with an speed ok 50.0km/h"
  end

  test "apply taxes" do
    Enum.each(
      [
        {12.5, "Price: 14.0 - Tax: 1.5"},
        {30.99, "Price: 34.7088 - Tax: 3.7188"},
        {250.49, "Price: 280.5488 - Tax: 30.0588"},
        {18.0, "Price: 20.16 - Tax: 2.16"}
      ],
      fn {value, expected} -> assert Chapter2.apply_tax(value) == expected end
    )
  end

  test "boxes" do
    result = Chapter2.boxes(126)

    assert result == %{"big" => 2, "medium" => 1, "remaining_matchstiks" => 1, "small" => 1}
  end
end
