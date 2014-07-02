defmodule Tree do
  # What's the smallest int value?
  @small_int -999999999

  def leaf(v), do: { :leaf, v }
  def branch(left, right), do: { :branch, left, right }


  # Exercise 25
  def tree_size({:leaf, _}), do: 1
  def tree_size({:branch, left, right}), do: 1 + tree_size(left) + tree_size(right)


  #Exercise 26
  defp max_acc({:leaf, v}, acc), do: max(v, acc)
  defp max_acc({:branch, left, right}, acc) do
    max(max_acc(left, acc), max_acc(right, acc))
  end

  def maximum(l), do: max_acc(l, @small_int)


  # Exercise 27
  def depth({:leaf, _}), do: 1
  def depth({:branch, left, right}), do: 1 + max(depth(left), depth(right))

  # Exercise 28
  def map({:leaf, v}, f), do: leaf(f.(v))
  def map({:branch, left, right}, f), do: branch( map(left,f ), map(right, f))


  # Exercise 29
  # This is not tail recursive, can it be since I have to call
  # fold twice?
  def fold({:leaf, v}, acc, _branch_func, leaf_func) do
    leaf_func.(v, acc)
  end
  def fold({:branch, left, right}, acc, branch_func, leaf_func) do
    branch_func.(fold(left, acc, branch_func, leaf_func),
                 fold(right, acc, branch_func, leaf_func))
  end

  def size_with_fold(t), do: fold(t, 0,
    fn(left_acc, right_acc) -> 1 + left_acc + right_acc end,
    fn(_v, _acc) -> 1 end
  )

  def max_with_fold(t), do: fold(t, @small_int,
    fn(left_acc, right_acc) -> max(left_acc, right_acc) end,
    fn(v, acc) -> max(v, acc) end
  )

  def depth_with_fold(t), do: fold(t, 0,
    fn(left_acc, right_acc) -> 1 + max(left_acc, right_acc) end,
    fn(_v, _acc) -> 1 end
  )

  def map_with_fold(t, f), do: fold(t, :nothing,
    fn(left_acc, right_acc) -> branch( left_acc, right_acc) end,
    fn(v, acc) -> leaf(f.(v)) end
  )
end
