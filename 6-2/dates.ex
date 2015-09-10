defmodule Dates do
	def julian(iso_date) do
		String.split(iso_date,"-") |> Enum.map(&String.to_integer/1) |> day_of_year
	end

	defp day_of_year([year,month,day]) when month>0 and day>0 and month<=12 and day<=31 and year>0 do
		count_days([31,28+leap_extra(year),31,30,31,30,31,31,30,31,30,31],month,1,day)
	end

	defp count_days([m|months],month,crt_month,day) when crt_month<month do
		count_days(months,month,crt_month+1,day+m)
	end
	defp count_days(_months,month,crt_month,day) when crt_month>=month do day end

	defp leap_extra(year) do
		cond do
			rem(year,4)==0 and rem(year,100)!=0 -> 1
			rem(year,400)==0 -> 1
			true -> 0
		end
	end

end
