defmodule FirstProject.Recursion.Reverse do
  def reverse(num, acc \\ 0)

  # base case
  def reverse(0, acc) do
    acc
  end

  # recursive case
  def reverse(num, acc) do
    reverse(div(num, 10), acc * 10 + rem(num, 10))
  end
end
