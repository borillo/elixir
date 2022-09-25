bread_slices = 10
bread_slice_price = 10
bottles_of_milk = 3
bottle_of_milk_price = 2
cakes = 1
cake_price = 15

IO.puts(
  bread_slices * bread_slice_price + bottles_of_milk * bottle_of_milk_price + cakes * cake_price
)

distance = 200
time = 4

IO.puts("Bob has traveled #{distance}km, in #{time}h with an speed ok #{distance / time}km/h")

tax = 12

apply_tax = fn price ->
  price_tax = price * (tax / 100)
  IO.puts("Price: #{price + price_tax} - Tax: #{price_tax}")
end

Enum.each([12.5, 30.99, 250.49, 18.0], apply_tax)

boxes = fn value ->
  big = div(value, 50)
  big_rest = rem(value, 50)

  medium = div(big_rest, 20)
  medium_rest = rem(big_rest, 20)

  small = div(medium_rest, 5)
  rest = rem(medium_rest, 5)

  IO.puts(
    to_string(big) <>
      ", " <> to_string(medium) <> ", " <> to_string(small) <> ", " <> to_string(rest)
  )

  # %{"big" => big, "medium" => medium, "small" => small, "remaining_matchstiks" => rest}
end

boxes.(126)
