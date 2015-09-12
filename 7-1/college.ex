defmodule College do
	def rooms do
		{:ok, fd} = File.open("courses.csv",[:read, :utf8])
		hd = HashDict.new
		parse_rooms(hd,fd)
	end

	defp parse_rooms(hd,fd) do
		case IO.read(fd,:line) do
			data -> add_course(hd,data,fd)
			{:eof} -> hd
			{:error, reason} ->
				IO.puts("Error reading file: #{reason}")
				hd
		end
	end

	defp add_course(hd,data,fd) do
		
	end
end
