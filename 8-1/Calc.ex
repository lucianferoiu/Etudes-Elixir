defmodule Calc do
	@dx 1.0e-10

	def deriv(f,x) do
		(f.(x+@dx) - f.(x))/@dx
	end
end
