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
    r1 = root(mfset, e1)
    r2 = root(mfset, e2)

    mergeRoot(mfset, r1, r2)
  end

  def mergeRoot(mfset, %{parent: r1}, %{parent: r2}) when r1 == r2, do: mfset

  def mergeRoot(mfset, %{parent: r1, size: s1}, %{parent: r2, size: s2}) do
    maxRoot = if s1 > s2, do: r1, else: r2
    minRoot = if s1 > s2, do: r2, else: r1

    %{mfset | minRoot => %{parent: maxRoot}, maxRoot => %{parent: maxRoot, size: s1 + s2}}
  end

  def mkMFSet(size) do
    Map.new(1..size, fn n -> {n, %{parent: n, size: 1}} end)
  end
end

defmodule Solution do
  #  use Application

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

  def busCost(inmates) do
    inmates
    |> :math.sqrt()
    |> Float.ceil()
    |> Kernel.trunc()
  end

  def computePairs() do
    inmates = readNumber()
    num_pairs = readNumber()

    set = MFSet.mkMFSet(inmates)

    pairs =
      for _ <- 1..num_pairs,
          do:
            IO.read(:stdio, :line)
            |> String.trim()
            |> mkPair

    Enum.reduce(pairs, set, fn {x, y}, acc -> MFSet.merge(acc, x, y) end)
    |> Enum.filter(fn {n, %{parent: p}} -> n == p end)
    |> Enum.reduce(0, fn {_, %{size: s}}, acc -> acc + busCost(s) end)
  end

  #  def start(_, _) do
  #    IO.puts(Solution.computePairs())
  #  end
end

IO.puts(Solution.computePairs())

# mix run lib/prison_transport.ex < fixtures/prision.txt
