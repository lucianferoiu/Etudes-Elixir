defmodule Cards do
	def make_deck do
		colors = ["♥","♦","♣","♠"]
		numbers = for i <- 2..10, do: Integer.to_string(i)
		ranks = ["A"| numbers] ++ ["J", "Q", "K"]
		for c <- colors, r <- ranks, do: {r,c}
	end

	def shuffle(list) do
		:random.seed(:erlang.timestamp)
		shuffle(list, [])
	end


	def shuffle([], acc), do: acc
	@doc "Splits the list of cards at random intervals and extracts the card at that position from the list"
	def shuffle(list, acc) do
		{leading, [h | t]} = Enum.split(list, :random.uniform(Enum.count(list)) - 1)
		shuffle(leading ++ t, [h | acc])
	end
end
