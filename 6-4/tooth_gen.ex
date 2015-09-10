defmodule ToothGen do
	def generate_depths(good_or_bad) do
		:random.seed(:erlang.now)
		gen_depths(good_or_bad,[])
	end

	defp gen_depths([],depths), do: depths
	defp gen_depths([?F|good_or_bad],depths), do: gen_depths(good_or_bad,[[0]|depths])
	defp gen_depths([?T|good_or_bad],depths) do
		td = gen_tooth([],6,:random.uniform)
		gen_depths(good_or_bad,[td|depths])
	end

	defp gen_tooth(depths,0,_prob), do: depths
	defp gen_tooth(depths,n,prob) do
		base = cond do
			prob >= 0.5 -> 3
			true -> 2
		end
		td = base + (:random.uniform(3)-2)
		gen_tooth([td|depths],n-1,prob)
	 end

end
