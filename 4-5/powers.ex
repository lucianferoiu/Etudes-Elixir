defmodule Powers do
	import Kernel, except: [raise: 2]

	def raise(_x,0), do: 1
	def raise( x,n), do: _raise(x,1,n)

	@doc """
	Newton's method for finding the n-th root of x
	"""
	def nth_root(x,1), do: x
	def nth_root(x,n), do: _nth_root(x,n,x,1,x)


	defp _raise(_x,acc,0), do: acc
	defp _raise( x,acc,n), do: _raise(x,x*acc,n-1)

	defp _nth_root(x,n,a,k,dx) when abs(dx) < 1.0e-30 or k>100 do a end
	defp _nth_root(x,n,a,k,dx) do
		f = raise(a,n)-x
		f_prime = n * raise(a,n-1)
		x_next = a - (f/f_prime)
		IO.puts "x_#{k} = #{x_next}"
		_nth_root(x,n,x_next,k+1,a-x_next)
	end

end
