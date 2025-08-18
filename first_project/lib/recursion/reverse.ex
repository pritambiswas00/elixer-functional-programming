defmodule FirstProject.Recursion.Reverse do
  def reverse(0, acc) do
    acc
  end
  def reverse(num, acc \\ 0) do
    reverse(div(num, 10), acc * 10 + rem(num, 10))
  end
end
