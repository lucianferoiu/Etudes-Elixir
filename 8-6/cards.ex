defmodule Cards do
	def make_deck do
		colors = ["♥","♦","♣","♠"]
		numbers = for i <- 2..10, do: Integer.to_string(i)
		ranks = ["A"| numbers] ++ ["J", "Q", "K"]
		# lc .. inlist was deprecated in Elixir v0.13.2
		for c <- colors, r <- ranks, do: {r,c}
	end

	def shuffle(list) do
		:random.seed(:erlang.timestamp)
		shuffle(list, [])
	end

	def shuffle([], acc), do: acc
	def shuffle(list, acc) do
		{leading, [h | t]} = Enum.split(list, :random.uniform(Enum.count(list)) - 1)
		shuffle(leading ++ t, [h | acc])
	end
end
