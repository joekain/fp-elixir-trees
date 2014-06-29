defmodule TreesTest do
  use ExUnit.Case

  def build_tree do
    Tree.branch(
      Tree.branch(
        Tree.branch(
          Tree.leaf(6),
          Tree.branch(
            Tree.leaf(5),
            Tree.leaf(4)
          )
        ),
        Tree.leaf(3)
      ),
      Tree.branch(
        Tree.branch(
          Tree.branch(
            Tree.leaf(2),
            Tree.leaf(1)
          ),
          Tree.leaf(0)
        ),
        Tree.leaf(0)
      )
    )
  end

  test "tree_size should count all nodes" do
    assert Tree.tree_size(build_tree) == 15
  end

  test "max should return the value of the maximum leaf" do
    assert Tree.maximum(build_tree) == 6
  end
end
