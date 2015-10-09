defmodule Cards do
	def make_deck do
		colors = ["♥","♦","♣","♠"]
		numbers = for i <- 2..10, do: Integer.to_string(i)
		ranks = ["A"| numbers] ++ ["J", "Q", "K"]
		for c <- colors, r <- ranks, do: {r,c}
	end
end
