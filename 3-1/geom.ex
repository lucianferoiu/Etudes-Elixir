defmodule Geom do
	def area(:rectangle, w, h), do:	w*h
	def area(:triangle,b,h), do: b*h/2.0
	def area(:ellipsis,r1,r2), do: :math.pi()*r1*r2
end
