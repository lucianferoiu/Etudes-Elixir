defmodule Stats do
	def min([h|t]), do: _min(h,t)
	def max([h|t]), do: _max(h,t)
	def range([h|t]), do: _range(h,h,t)

	defp _min(crt_m,[]), do: crt_m
	defp _min(crt_m,[h|t]) when h<crt_m do _min(h,t) end
	defp _min(crt_m,[h|t]) when h>=crt_m do _min(crt_m,t) end

	defp _max(crt_m,[]), do: crt_m
	defp _max(crt_m,[h|t]) when h>crt_m do _max(h,t) end
	defp _max(crt_m,[h|t]) when h<=crt_m do _max(crt_m,t) end

	defp _range(crt_mn,crt_mx,[]), do: [crt_mn,crt_mx]
	defp _range(crt_mn,crt_mx,[h|t]) do
		if crt_mn>h, do: crt_mn=h
		if crt_mx<h, do: crt_mx=h
		_range(crt_mn,crt_mx,t)
	end

end
