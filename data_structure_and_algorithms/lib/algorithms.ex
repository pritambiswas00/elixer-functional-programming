defmodule DataStructureAndAlgorithms.Algorithms do
  def sort_array([]), do: []
  def sort_array([a]), do: [a]
  def sort_array(list) when is_list(list) do
    { left, right } = Enum.split(list, div(length(list), 2))
    merge(sort_array(left), sort_array(right))
  end
  defp merge([], right), do: right
  defp merge(left, []), do: left
  defp merge([head_left, tail_left],[head_right, tail_right]) do
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
      { positive, negative } = count_nums(nums, 0,0)
      max(positive, negative)
  end
  defp count_nums([], positive, negative), do: { positive, negative }
  defp count_nums([head | tail], positive, negative) when head < 0 do
    count_nums(tail, positive, negative + 1)
  end
  defp count_nums([head | tail], positive, negative) when head > 0 do
    count_nums(tail, positive + 1, negative)
  end
end
