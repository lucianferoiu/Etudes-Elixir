defmodule Geom do
	@moduledoc """
		Trivial geometry module, part of the "Études for Elixir" exercises
	"""

	@doc """
	Calculates the area of a rectangle, provided width and height as parameters.
	The height is implicitly equal to 1, if the argument is not provided

	    iex> Geom.area 5, 6
	    30

	"""
	def area(w, h \\ 1.0) when is_number(w) do
			w*h
	end
end
