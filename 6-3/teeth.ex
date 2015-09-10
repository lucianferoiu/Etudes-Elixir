defmodule Teeth do
	def pocket_depths do
	  [
			[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
		  [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
		  [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
		  [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
		  [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
		  [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
		  [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
		  [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
		  [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
		  [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
		  [3,2,3,2,3,2]
		]
	end

	def alert(depths) do
		suspect_teeth(depths,1,[])
	end

	defp suspect_teeth([],_idx,suspects), do: Enum.reverse(suspects)
	defp suspect_teeth([[0]|teeth],idx,suspects), do:
		suspect_teeth(teeth,idx+1,suspects)
	defp suspect_teeth([tooth|teeth],idx,suspects), do:
		suspect_teeth(teeth,idx+1,suspect_tooth(tooth,idx,suspects))

	defp suspect_tooth([],_idx,suspects), do: suspects
	defp suspect_tooth([d|_depths],idx,suspects) when d>=4 do [idx|suspects] end
	defp suspect_tooth([_d|depths],idx,suspects), do: suspect_tooth(depths,idx,suspects)

end
