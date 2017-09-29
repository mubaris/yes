defmodule Yes do
    def run(y \\ "y") do
        IO.puts y
        Yes.run y
    end
end