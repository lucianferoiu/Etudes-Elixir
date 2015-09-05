defmodule Geom do
	def area(shape,p1,p2) when p1>=0 and p2>=0 do
		case shape do
			:rectangle -> p1*p2
			:ellipsis -> p1*p2*:math.pi()
			:triangle -> p1*p2/2.0
			_ -> 0
		end
	end
end
