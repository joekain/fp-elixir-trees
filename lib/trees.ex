defmodule Tree do
  def leaf(v), do: { :leaf, v }
  def branch(left, right), do: { :branch, left, right }

  def tree_size({:leaf, _}), do: 1
  def tree_size({:branch, left, right}), do: 1 + tree_size(left) + tree_size(right)

  defp max_acc({:leaf, v}, acc), do: max(v, acc)
  defp max_acc({:branch, left, right}, acc) do
    max(max_acc(left, acc), max_acc(right, acc))
  end

  # What's the smallest int value?
  def maximum(l), do: max_acc(l, -999999999)

  def depth({:leaf, _}), do: 1
  def depth({:branch, left, right}), do: 1 + max(depth(left), depth(right))
end
