defmodule TicTacToe do
  def winner({ a, _, _,
               _, a, _,
               _, _, a }), do: {:winner, a}
  def winner({ _, a, _,
               _, a, _,
               _, a, _ }), do: {:winner, a}
  def winner(_), do: :no_winner
end

defmodule Chapter3Test do
  use ExUnit.Case

  test "total prices of goods" do
    assert TicTacToe.winner({
      :x, :o, :x,
      :o, :x, :o,
      :o, :o, :x
    }) == {:winner, :x}

    assert TicTacToe.winner({
      :o, :x, :x,
      :x, :x, :o,
      :o, :x, :o
    }) == {:winner, :x}

    assert TicTacToe.winner({
      :x, :o, :x,
      :o, :x, :o,
      :o, :x, :o
    }) ==:no_winner
  end

  test "guards" do
    defmodule NumberCompare do
      def greater(8, other_number) when 8 >= other_number, do: 8
      def greater(_, other_number), do: other_number

      def greaterCase(number, other_number) do
        case {number, other_number} do
          {8, other_number} when number >= other_number -> number
          {_, other_number} -> other_number
        end
      end

      def head([]), do: nil
      def head([h | t]), do: h
    end

    assert NumberCompare.greater(8, 2) == 8
    assert NumberCompare.greaterCase(8, 2) == 8
    assert NumberCompare.head([]) == nil
    assert NumberCompare.head([1, 2, 3]) == 1
  end
end
