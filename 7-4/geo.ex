defmodule Country do
	defstruct name: nil, lang: "en", cities: []
end

defmodule City do
	defstruct name: nil, lat: 0.0, long: 0.0, population: 0
end

defprotocol Valid do
	def valid?(data)
end

defimpl Valid, for: City do
	def valid?(%City{population: pop, lat: lat, long: long}) do
		cond do
			long <= -180.0 || long >= 180.0 -> false
			lat <= -180.0 || lat >= 180.0 -> false
			pop < 0 -> false
			true -> true
		end
	end
end

defimpl Inspect, for: City do
	import Inspect.Algebra
	def inspect(data,_opts) do
		[data.name, " (", to_string(data.lat), ",", to_string(data.long),") - ",to_string(data.population)," inhabitants", break] |> concat
	end
end

defimpl Inspect, for: Country do
	import Inspect.Algebra
	def inspect(data, opts) do
		[break("\n"), data.name, break, " - official language: ", data.lang, ", cities: ", break("\n"), data.cities |> to_doc(opts) , break("\n")] |> concat
	end
end

defmodule Geo do
	def make_geo_list(filename) do
		{:ok, fd} = File.open(filename,[:read, :utf8])
		parse_file(fd,[]) |> Enum.reverse |> IO.inspect
	end

	def parse_file(fd,countries) do
		case IO.read(fd,:line) do
			:eof -> countries
			{:error,reason} ->
				IO.puts "Erorr reading file: #{reason}"
			line ->
				parse_file(fd,update_countries(countries,line))
		end
	end

	def update_countries(countries, line) do
		entries = String.strip(line) |> String.split(",")
		case entries do
			[country,lang] ->
				[%Country{name: country, lang: lang}|countries]
			[city, pop, lat, long] ->
				new_city = %City{name: city, lat: String.to_float(lat), long: String.to_float(long), population: String.to_integer(pop)}
				[latest_country| other_countries] = countries
				[%Country{latest_country | cities: [new_city|latest_country.cities]} | other_countries]
		end

	end

end
