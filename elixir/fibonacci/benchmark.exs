defmodule RunBenchmark do
  @moduledoc """
  Documentation for `RunBenchmark`.
  """
  
  @memory_time 2

  @doc """
  run
  """
  def run(n) do
    IO.puts("========================================")
    IO.puts("ITERATIONS:  #{inspect(n)}")
    IO.puts("========================================")
    IO.puts("")
  
    run_number(n)
    
    IO.puts("")
    IO.puts("----------------------------------------")
    IO.puts("")
    
    run_sequence(n)
  end
  
  @doc """
  run_number
  """
  def run_number(n) do
    Benchee.run(%{
      # "FibonacciMLibby - number" =>
      #   fn -> FibonacciMLibby.number(n)
      # end,
      "Fibonacci - number" =>
        fn -> Fibonacci.number(n)
      end
    },
    memory_time: @memory_time)
  end
  
  @doc """
  run_sequence
  """
  def run_sequence(n) do
    Benchee.run(%{
      # "FibonacciMLibby - sequence" =>
      #   fn -> FibonacciMLibby.sequence(n)
      # end,
      "Fibonacci - sequence_list_forward" =>
        fn -> Fibonacci.sequence_list_forward(n)
      end,
      "Fibonacci - sequence_tuple_forward" =>
        fn -> Fibonacci.sequence_tuple_forward(n)
      end
    },
    memory_time: @memory_time)
  end
end

# ------------------------------------------------------------------------------

RunBenchmark.run(100)

# RunBenchmark.run(1000)

# RunBenchmark.run(10000)

