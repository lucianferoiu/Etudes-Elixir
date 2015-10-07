defmodule Stats do
	def mean(lst) do
		List.foldl(lst,0,&(&1+&2)) / length(lst)
	end

	def std(lst) when length(lst)>0 do
		n = length(lst)
		sum = List.foldl(lst,0,&(&1+&2))
		sum_sq = List.foldl(lst,0,&( (&1*&1)+&2) )
		# IO.puts "Sum: #{sum}, Sum sq: #{sum_sq}, n: #{n}"
		:math.sqrt ( (sum_sq*n) - (sum*sum) ) / (n*(n-1))
	end

end
