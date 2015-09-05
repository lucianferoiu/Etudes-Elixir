defmodule Dijkstra do

	@doc """
	Computes the Greatest Common Denominator of two integers based on Dijkstra's algorithm

	    iex>Dijkstra.gcd(8,6)
	    2

	"""
	def gcd(m,n) when is_integer(m) and is_integer(n) do
		_gcd(m,n)
	end

	defp _gcd(m,m), do: m
	defp _gcd(m,n) when m>n do _gcd(m-n,n) end
	defp _gcd(m,n) when m<n do _gcd(m,n-m) end

end
