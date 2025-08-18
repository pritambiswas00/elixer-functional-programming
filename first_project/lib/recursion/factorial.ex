defmodule FirstProject.Recursion.Factorial do
  def of(1) do
    1
  end
  def of(num) do
    num * of(num - 1)
  end
  def _tail_recursion(num, acc \\ 1)
  def _tail_recursion(1, acc) do
    acc
  end
  def _tail_recursion(num, acc) do
    _tail_recursion(num - 1, acc * num)
  end

end
