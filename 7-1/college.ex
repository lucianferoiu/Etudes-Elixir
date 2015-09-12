defmodule College do
	def rooms do
		{:ok, fd} = File.open("courses.csv",[:read, :utf8])
		hd = HashDict.new
		parse_rooms(hd,fd)
	end

	defp parse_rooms(hd,fd) do
		case IO.readline(fd) do
			
			{:eof} -> hd
		end
	end
end
