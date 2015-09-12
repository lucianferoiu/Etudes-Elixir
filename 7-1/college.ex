defmodule College do
	def rooms do
		{:ok, fd} = File.open("courses.csv",[:read, :utf8])
	end
end
