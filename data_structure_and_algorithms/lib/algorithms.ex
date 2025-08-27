defmodule DataStructureAndAlgorithms.Algorithms do
  def sort_array([]), do: []
  def sort_array([a]), do: [a]

  def sort_array(list) when is_list(list) do
    {left, right} = Enum.split(list, div(length(list), 2))
    merge(sort_array(left), sort_array(right))
  end

  def merge([], right), do: right
  def merge(left, []), do: left

  def merge([head_left, tail_left], [head_right, tail_right]) do
    if head_left <= head_right do
      [head_left | merge(tail_left, [head_right, tail_right])]
    else
      [head_right | merge([head_left | tail_left], head_right)]
    end
  end

  def intersection(nums1, nums2) do
    set1 = MapSet.new(nums1)
    set2 = MapSet.new(nums2)

    MapSet.intersection(set1, set2)
    |> MapSet.to_list()
  end

  @spec maximum_count(nums :: [integer]) :: integer
  def maximum_count(nums) do
    {positive, negative} = count_nums(nums, 0, 0)
    max(positive, negative)
  end

  defp count_nums([], positive, negative), do: {positive, negative}

  defp count_nums([head | tail], positive, negative) when head < 0 do
    count_nums(tail, positive, negative + 1)
  end

  defp count_nums([head | tail], positive, negative) when head > 0 do
    count_nums(tail, positive + 1, negative)
  end

  def console(str) when is_binary(str) do
    IO.inspect(str)
  end

  def replace_last_element([_], new), do: [new]
  def replace_last_element([h | t], new), do: [h | replace_last_element(t, new)]

  def apply_operations_step([a, b | tail]) do
    if a == b do
      [a * 2, 0 | apply_operations_step(tail)]
    else
      [a | apply_operations_step([b | tail])]
    end
  end

  def apply_operations_step(list), do: list
  @spec apply_operations(nums :: [integer]) :: [integer]
  def apply_operations(nums) when is_list(nums) do
    updated_list =
      nums
      |> apply_operations_step()

    non_zeros = Enum.filter(updated_list, &(&1 !== 0))
    zeros = Enum.filter(updated_list, &(&1 == 0))
    non_zeros ++ zeros
  end

  def climb_stairs(n, _memo) when n < 0, do: 0
  def climb_stairs(0, _memo), do: 1

  def climb_stairs(n, memo \\ %{}) do
    case Map.get(memo, n) do
      nil ->
        {ways1, memo1} = climb_stairs(n - 1, memo)
        {ways2, memo2} = climb_stairs(n - 2, memo1)
        total = ways1 + ways2
        memo3 = Map.put(memo2, n, total)
        {total, memo3}

      value ->
        value
    end
  end

  @spec generate(num_rows :: integer) :: [[integer]]
  def generate(num_rows) when num_rows <= 0, do: []

  def generate(num_rows) do
    generate_rows(num_rows, 1, [])
  end

  defp generate_rows(num_rows, current_row, acc) when current_row > num_rows do
    Enum.reverse(acc)
  end

  defp generate_rows(num_rows, current_row, acc) do
    new_row =
      generate_row(current_row, current_row - 1, acc, [])

    generate_rows(num_rows, current_row + 1, [new_row | acc])
  end

  defp generate_row(_, 0, _acc, row_acc), do: Enum.reverse([1 | row_acc])

  defp generate_row(row_index, j, acc, row_acc) do
    prev_row = hd(acc)
    value = Enum.at(prev_row, j - 1) + Enum.at(prev_row, j)
    generate_row(row_index, j - 1, acc, [value | row_acc])
  end
end
