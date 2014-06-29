defmodule Tree do
  def leaf(v), do: { :leaf, v }
  def branch(left, right), do: { :branch, left, right }

  def tree_size({:leaf, _}), do: 1
  def tree_size({:branch, left, right}), do: 1 + tree_size(left) + tree_size(right)

end
