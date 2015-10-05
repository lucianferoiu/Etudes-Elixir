defmodule Country do
	defstruct name: nil, lang: "en", cities: []
end

defmodule City do
	defstruct name: nil, lat: 0.0, long: 0.0, population: 0
end


defmodule Geo do

	def make_geo_list(filename) do
		{:ok, fd} = File.open(filename,[:read, :utf8])
		parse_file(fd,[]) |> Enum.reverse
	end

	def total_population(countries, lang) do
		tot_pop(countries,lang,0)
	end

	defp parse_file(fd,countries) do
		case IO.read(fd,:line) do
			:eof -> countries
			{:error,reason} ->
				IO.puts "Erorr reading file: #{reason}"
			line ->
				parse_file(fd,update_countries(countries,line))
		end
	end

	defp update_countries(countries, line) do
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

	defp tot_pop([],lang,total), do: total
	defp tot_pop([%Country{lang: lang, cities: cities}|rest],lang,total), do:	tot_pop(rest,lang,tot_cities(cities,total))
	defp tot_pop([_|rest],lang,total), do: tot_pop(rest,lang, total)

	defp tot_cities([],total), do: total
	defp tot_cities([%City{population: pop}|rest], total), do: tot_cities(rest,total+pop)

end
