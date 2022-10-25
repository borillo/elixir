defmodule MFSet do
  def find(mfset, e) do
    %{parent: p} = root(mfset, e)
    p
  end

  def root(mfset, e) do
    node = mfset[e]
    %{parent: p} = node

    if p == e do
      node
    else
      root(mfset, p)
    end
  end

  def merge(mfset, e1, e2) do
    %{parent: p1, size: s1} = root(mfset, e1)
    %{parent: p2, size: s2} = root(mfset, e2)

    pM = if s1 > s2, do: p1, else: p2
    pm = if s1 > s2, do: p2, else: p1

    %{mfset | pm => %{parent: pM}, pM => %{parent: pM, size: s1 + s2}}
  end

  def mkMFSet(size) do
    Map.new(1..size, fn n -> {n, %{parent: n, size: 1}} end)
  end
end

defmodule Solution do
  def readNumber() do
    IO.read(:stdio, :line)
    |> String.trim()
    |> String.to_integer()
  end

  def mkPair(line) do
    [x, y] =
      line
      |> String.split(" ")
      |> Enum.map(&String.to_integer/1)

    {x, y}
  end

  def computePairs() do
    inmates = readNumber()
    num_pairs = readNumber()

    set = MFSet.mkMFSet(inmates)

    pairs = for _ <- 1..num_pairs,
        do:
          IO.read(:stdio, :line)
          |> String.trim
          |> mkPair

    Enum.reduce(pairs, set, fn {x, y}, acc -> MFSet.merge(acc, x, y) end)
      |> Enum.filter(fn {n, %{ parent: p}} -> n == p end)
  end
end

IO.puts Solution.computePairs()

# mix run lib/prison_transport.ex < fixtures/prision.txt
