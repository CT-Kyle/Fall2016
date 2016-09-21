## S1
defmodule Countdown do

  def from(0), do: IO.puts "Boom"
  def from(n) do
    IO.puts n
    from(j-1)
  end

end
Countdown.from 10
