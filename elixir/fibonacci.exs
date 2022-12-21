# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# based on:
# https://hachyderm.io/@mlibby/109548310574605544
# by https://github.com/mlibby

defmodule Fibonacci do

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
