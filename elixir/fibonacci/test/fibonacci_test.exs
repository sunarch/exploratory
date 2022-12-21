defmodule FibonacciTest do
  use ExUnit.Case
  doctest Fibonacci

  test "Fibonacci number 5" do
    assert Fibonacci.number(10) == 55
  end
end
