defmodule Geom do
	def area(shape,p1,p2) when p1>=0 and p2>=0 do
		_area(shape,p1,p2)
	end
	defp _area(:rectangle, w, h), do:	w*h
	defp _area(:triangle,b,h), do: b*h/2.0
	defp _area(:ellipsis,r1,r2), do: :math.pi()*r1*r2
end
