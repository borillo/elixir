defmodule Chapter2 do
  def total_price_goods(
        bread_slices,
        bread_slice_price,
        bottles_of_milk,
        bottle_of_milk_price,
        cakes,
        cake_price
      ) do
    bread_slices * bread_slice_price + bottles_of_milk * bottle_of_milk_price +
      cakes * cake_price
  end

  def distance_traveled(distance, time) do
    "Bob has traveled #{distance}km, in #{time}h with an speed ok #{distance / time}km/h"
  end

  def apply_tax(price) do
    tax = 12

    price_tax = price * (tax / 100)
    "Price: #{price + price_tax} - Tax: #{price_tax}"
  end

  def boxes(value) do
    big = div(value, 50)
    big_rest = rem(value, 50)

    medium = div(big_rest, 20)
    medium_rest = rem(big_rest, 20)

    small = div(medium_rest, 5)
    rest = rem(medium_rest, 5)

    %{"big" => big, "medium" => medium, "small" => small, "remaining_matchstiks" => rest}
  end
end
