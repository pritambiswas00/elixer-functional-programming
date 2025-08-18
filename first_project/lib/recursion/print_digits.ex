defmodule FirstProject.Recursion.PrintDigits do
  def upto(0) do
    IO.puts(0)
  end
   def upto(num) do
     IO.puts(num)
     upto(num-1)
   end
end
