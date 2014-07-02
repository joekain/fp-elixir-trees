defmodule Tree do
  def leaf(v), do: { :leaf, v }
  def branch(left, right), do: { :branch, left, right }


  # Exercise 25
  def tree_size({:leaf, _}), do: 1
  def tree_size({:branch, left, right}), do: 1 + tree_size(left) + tree_size(right)


  #Exercise 26
  def maximum({:leaf, v}), do: v
  def maximum({:branch, left, right}), do: max(maximum(left), maximum(right))


  # Exercise 27
  def depth({:leaf, _}), do: 1
  def depth({:branch, left, right}), do: 1 + max(depth(left), depth(right))


  # Exercise 28
  def map({:leaf, v}, f), do: leaf(f.(v))
  def map({:branch, left, right}, f), do: branch( map(left,f ), map(right, f))


  # Exercise 29
  # This is not tail recursive, can it be since I have to call
  # fold twice?
  def fold({:leaf, v}, leaf_func, _branch_func) do
    leaf_func.(v)
  end
  def fold({:branch, left, right}, leaf_func, branch_func) do
    branch_func.(fold(left, leaf_func, branch_func),
                 fold(right, leaf_func, branch_func))
  end

  def size_with_fold(t), do: fold(t,
    fn(_v) -> 1 end,
    fn(left_acc, right_acc) -> 1 + left_acc + right_acc end
  )

  def max_with_fold(t), do: fold(t,
    fn(v) -> v end,
    fn(left_acc, right_acc) -> max(left_acc, right_acc) end
  )

  def depth_with_fold(t), do: fold(t,
    fn(_v) -> 1 end,
    fn(left_acc, right_acc) -> 1 + max(left_acc, right_acc) end
  )

  def map_with_fold(t, f), do: fold(t,
    fn(v) -> leaf(f.(v)) end,
    fn(left_acc, right_acc) -> branch(left_acc, right_acc) end
  )
end
