# frozen_string_literal: true

Node = Struct.new(:value, :left, :right)

# class Zipper
class Zipper
  Crumb = Struct.new(:side, :value, :sibling)

  attr_reader :focus, :crumbs

  def initialize(focus, crumbs = []) = (@focus = focus
                                        @crumbs = crumbs)

  def self.from_tree(tree) = new(tree)
  def value = focus.value
  def left = descend(:left, focus.left, focus.right)
  def right = descend(:right, focus.right, focus.left)

  def up
    crumb = crumbs.last
    return unless crumb

    parent =
      if crumb.side == :left
        Node.new(crumb.value, focus, crumb.sibling)
      else
        Node.new(crumb.value, crumb.sibling, focus)
      end

    self.class.new(parent, crumbs[0...-1])
  end

  def set_value(value) = self.class.new(Node.new(value, focus.left, focus.right), crumbs)
  def set_left(left) = self.class.new(Node.new(focus.value, left, focus.right), crumbs)
  def set_right(right) = self.class.new(Node.new(focus.value, focus.left, right), crumbs)
  def ==(other) = other.is_a?(Zipper) && [focus, crumbs] == [other.focus, other.crumbs]

  def to_tree
    zipper = self

    loop do
      parent = zipper.up
      return zipper.focus unless parent

      zipper = parent
    end
  end

  private

  def descend(side, child, sibling) = child && self.class.new(child, crumbs + [Crumb.new(side, focus.value, sibling)])
end
