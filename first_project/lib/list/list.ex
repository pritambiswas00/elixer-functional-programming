defmodule FirstProject.Lists do
  @moduledoc """
  Function Summary:

  1. sum_test
  """
  @doc """
  Returns the sum of the numbers in the list
  """
  @spec sum_test(list(number())) :: number()
  def sum_test([]) do
    0
  end
  def sum_test([h | t]) do
    h + sum_test(t)
  end

  def reverse_list(elements, acc \\ [])
  def reverse_list([], acc) do
    acc
  end
  def reverse_list([h | t], acc) do
    reverse_list(t, [h | acc])
  end
  @spec multiplication(list(number())) :: list(number())
  def multiplication(list) when is_list(list) do
      Enum.map(list, fn x -> x * 2  end)
  end
  def multiplication(_not_a_list) do
    {:error, "Expected a list"}
  end
  def first_letter_twice(s) when is_binary(s) do
    s
    |> String.graphemes()
    |> Enum.reduce_while(MapSet.new(), fn ch, seen ->
      if MapSet.member?(seen, ch) do
        { :halt, ch }
      else
        {:cont, MapSet.put(seen, ch)}
      end

    end)
  end
  def concat_list(list) when is_list(list) do
     [1,2,3] ++ list
  end
end
