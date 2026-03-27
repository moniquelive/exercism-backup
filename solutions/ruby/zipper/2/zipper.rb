# frozen_string_literal: true

Node = Struct.new(:value, :left, :right)

# class Zipper
class Zipper
  attr_reader :tree, :path

  def initialize(tree, path = []) = (@tree = tree
                                     @path = path)

  def self.from_tree(tree) = new(tree)
  def value = focus.value
  def left = descend(:left)
  def right = descend(:right)
  def up = path.empty? ? nil : self.class.new(tree, path[0...-1])
  def set_value(value) = update { |node| Node.new(value, node.left, node.right) }
  def set_left(left) = update { |node| Node.new(node.value, left, node.right) }
  def set_right(right) = update { |node| Node.new(node.value, node.left, right) }
  def ==(other) = other.is_a?(Zipper) && [tree, path] == [other.tree, other.path]
  def to_tree = tree

  private

  def focus = path.reduce(tree) { |node, side| node.public_send(side) }
  def descend(side) = focus.public_send(side) && self.class.new(tree, path + [side])
  def update(&block) = self.class.new(rebuild(tree, path, &block), path)

  def rebuild(node, steps, &block)
    side, *rest = steps
    return block.call(node) unless side

    child = rebuild(node.public_send(side), rest, &block)
    side == :left ? Node.new(node.value, child, node.right) : Node.new(node.value, node.left, child)
  end
end
