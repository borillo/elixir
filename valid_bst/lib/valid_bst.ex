defmodule Solution do
  def readNumber() do
    IO.read(:stdio, :line)
    |> String.trim()
    |> String.to_integer()
  end

  def readProblem() do
    readNumber()
    IO.read(:stdio, :line)
	|> String.trim()
	|> String.split(" ")
	|> Enum.map(&String.to_integer/1)
  end

  def is_bst([]), do: true
  def is_bst([_]), do: true
  def is_bst([root | children ]) do
    left = children |> Enum.take_while(&(&1 < root))
	right = Enum.slice(children, length(left) .. -1)
	Enum.all?(right, &(&1 > root)) && is_bst(left) && is_bst(right)
  end

  def solve() do
    n = readNumber()
	solveProblems(n)
  end

  def solveProblems(0) do end
  def solveProblems(n) do
    readProblem()
	|> is_bst
	|> bool_to_string
	|> IO.puts
	solveProblems(n-1)
  end

  def bool_to_string(b) do
	if b do "YES" else "NO" end
  end
end

IO.puts(Solution.solve())
