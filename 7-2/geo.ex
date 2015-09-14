defmodule Country do
	defstruct name: nil, lang: "en", cities: []
end

defmodule City do
	defstruct name: nil, lat: 0.0, long: 0.0, population: 0
end

defmodule Geo do
	def make_geo_list(filename) do
		{:ok, fd} = File.open(filename,[:read, :utf8])
	end


end
