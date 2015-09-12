defmodule College do
	def rooms do
		{:ok, fd} = File.open("courses.csv",[:read, :utf8])
		hd = HashDict.new
		parse_rooms(hd,fd)
	end

	defp parse_rooms(hd,fd) do
		case IO.read(fd,:line) do
			:eof -> hd
			{:error, reason} ->
				IO.puts("Error reading file: #{reason}")
				hd
			data -> add_course(hd,data,fd)
		end
	end

	defp add_course(hd,line,fd) do
		[cid,ctitle,room] = String.strip(line) |> String.split(",")
		existing_courses = Dict.get(hd,room,[])
		courses = [{String.to_integer(cid),ctitle}|existing_courses]
		hd2 = Dict.put(hd,room,courses)
		parse_rooms(hd2,fd)
	end
end
