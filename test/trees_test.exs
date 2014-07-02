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

  test "depth should compute the maxium depth of the tree" do
    assert Tree.depth(build_tree) == 5
  end

  # Not sure how best to test this, use max to confirm a value
  test "map should apply a function to all leaf nodes" do
    assert Tree.maximum(Tree.map(build_tree, fn(v) -> v * v end)) == 36
  end

  test "size with fold should compute the same as size" do
    assert Tree.size_with_fold(build_tree) == 15
  end

  test "max with fold should compute the same as max" do
    assert Tree.max_with_fold(build_tree) == 6
  end

  test "depth with fold should compute the same as depth" do
    assert Tree.depth_with_fold(build_tree) == 5
  end

  test "map with fold should compute the same as map" do
    assert Tree.maximum(Tree.map_with_fold(build_tree, fn(v) -> v * v end)) == 36
  end
end
