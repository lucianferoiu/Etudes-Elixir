defmodule Cards do
	def make_deck do
		colors = ["♥","♦","♣","♠"]
		numbers = for i <- 2..10, do: Integer.to_string(i)
		ranks = ["A"| numbers] ++ ["J", "Q", "K"]
		# lc .. inlist was deprecated in Elixir v0.13.2
		for c <- colors, r <- ranks, do: {r,c}
	end
end
