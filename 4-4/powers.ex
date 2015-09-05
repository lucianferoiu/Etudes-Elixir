defmodule Powers do
	import Kernel, except: [raise: 2]

	def raise(_x,0), do: 1
	def raise( x,n), do: _raise(x,1,n)

	defp _raise(_x,acc,0), do: acc
	defp _raise( x,acc,n), do: _raise(x,x*acc,n-1)

end
