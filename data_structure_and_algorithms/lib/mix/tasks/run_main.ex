# lib/mix/tasks/run_main.ex
defmodule Mix.Tasks.RunMain do
  use Mix.Task

  @shortdoc "Runs the main module"

  def run(_args) do
    Mix.Task.run("compile")
    DataStructureAndAlgorithms.Algorithms.console("Hello from the Algorithms")
    # result = DataStructureAndAlgorithms.Algorithms.apply_operations([1,2,2,1,1,0])
    # result1 = DataStructureAndAlgorithms.Algorithms.climb_stairs(3)
    result = DataStructureAndAlgorithms.Algorithms.generate(5)
    IO.inspect(result)
  end
end
