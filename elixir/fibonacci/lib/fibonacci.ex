# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

defmodule Fibonacci do
  @moduledoc """
  Documentation for `Fibonacci`.
  """
  
  @doc """
  Fibonacci number, 0-indexed.
  """
  def number(0), do: 0
  def number(n) do 
    {_, second} = _number(n)
    second
  end
  defp _number(1), do: {0, 1}
  defp _number(n) do
    {first, second} = _number(n-1)
    {second, first + second}
  end
  
  @doc """
  sequence_list_forward
  Fibonacci sequence, 0-indexed.
  
  List-building, front-to-end.
  This is a very slow implementation for larger indexes.
  """
  def sequence_list_forward(0), do: [0]
  def sequence_list_forward(1), do: [0, 1]
  def sequence_list_forward(n) do
    {_, _, seq} = _sequence_list_forward(n)
    seq
  end
  defp _sequence_list_forward(1), do: {0, 1, [0, 1]}
  defp _sequence_list_forward(n) do
    {prev, last, seq} = _sequence_list_forward(n-1)
    new = prev + last
    {last, new, seq ++ [new]}
  end
  
  @doc """
  sequence_tuple_forward
  Fibonacci sequence, 0-indexed.
  
  Tuple-building, front-to-end.
  """
  def sequence_tuple_forward(0), do: {0}
  def sequence_tuple_forward(1), do: {0, 1}
  def sequence_tuple_forward(n) do
    {_, _, seq} = _sequence_tuple_forward(n)
    seq
  end
  defp _sequence_tuple_forward(1), do: {0, 1, {0, 1}}
  defp _sequence_tuple_forward(n) do
    {prev, last, seq} = _sequence_tuple_forward(n-1)
    new = prev + last
    {last, new, Tuple.append(seq, new)}
  end
end
