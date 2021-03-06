defmodule Geom do
	def area(shape,p1,p2) when p1>=0 and p2>=0 do
		_area(shape,p1,p2)
	end
	def area(_,_,_), do: 0

	def main do
		prompt_user
	end

	def prompt_user do
		shape = prompt_shape |> shape_to_atom
		IO.puts "Shape is #{shape}"
		if shape != :quit do
			p1 = prompt_number(1) |> String.to_integer
			p2 = prompt_number(2) |> String.to_integer
			val = area(shape,p1,p2)
			IO.puts "Result: #{val}"
			prompt_user
		end
	end

	def prompt_shape do
		ch = IO.gets "Shape: R)ectangle / E)llipse / T)riangle / Q)uit: "
		String.strip(ch,?\n) |> String.upcase
	end

	def shape_to_atom(ch) do
		case ch do
			"R" -> :rectangle
			"E" -> :ellipsis
			"T" -> :triangle
			 _  -> :quit
		end
	end

	def prompt_number(ord) do
		nr = IO.gets "Parameter #{ord}: "
		nr2 = String.strip nr,?\n
		if Regex.match?(~r/\A[0-9]+\z/,nr2) do
			nr2
		else
			IO.puts "Parameter #{ord} needs to be an integer"
			prompt_number(ord)
		end
	end

	defp _area(:rectangle, w, h), do:	w*h
	defp _area(:triangle,b,h), do: b*h/2.0
	defp _area(:ellipsis,r1,r2), do: :math.pi()*r1*r2
	defp _area(_,_,_), do: 0
end
