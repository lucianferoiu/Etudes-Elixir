defmodule Dates do
	def date_parts(iso_date) do
		String.split(iso_date,"-") |> Enum.map &String.to_integer/1
	end
end
