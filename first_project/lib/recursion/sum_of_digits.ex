defmodule FirstProject.Recursion.SumOfDigits do
    def sum(0, initial_value) do
      initial_value
    end
    def sum(start, initial_value) do
        sum(start - 1, initial_value+start)
    end
end
