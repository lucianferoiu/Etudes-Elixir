defmodule Country do
	defstruct name: nil, lang: "en", cities: []
end

defmodule City do
	defstruct name: nil, lat: 0.0, long: 0.0, population: 0
end

defmodule Geo do
	def make_geo_list(filename) do
		{:ok, fd} = File.open(filename,[:read, :utf8])
		countries = parse_file(fd,[])
	end

	def parse_file(fd,countries) do
		case File.read(fd,:line) of
			:eof -> countries
			{:error,reason} -> IO.puts "Erorr reading file: #{reason}"
			line ->
				parse_file(fd,update_countries(countries,line))
		end
	end

end
