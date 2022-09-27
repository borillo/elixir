defmodule Chapter2Test do
  use ExUnit.Case
  doctest FpElixir

  test "total prices of goods" do
    bread_slices = 10
    bread_slice_price = 10
    bottles_of_milk = 3
    bottle_of_milk_price = 2
    cakes = 1
    cake_price = 15

    result =
      FpElixir.total_price_goods(
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
    result = FpElixir.distance_traveled(200, 4)

    assert result == "Bob has traveled 200km, in 4h with an speed ok 50.0km/h"
  end

  test "apply taxes" do
    assert FpElixir.apply_tax(12.5) == "Price: 14.0 - Tax: 1.5"
    assert FpElixir.apply_tax(30.99) == "Price: 34.7088 - Tax: 3.7188"
    assert FpElixir.apply_tax(250.49) == "Price: 280.5488 - Tax: 30.0588"
    assert FpElixir.apply_tax(18.0) == "Price: 20.16 - Tax: 2.16"
  end

  test "boxes" do
    result = FpElixir.boxes(126)

    assert result == %{"big" => 2, "medium" => 1, "remaining_matchstiks" => 1, "small" => 1}
  end
end
