# frozen_string_literal: true

# class Op
class Op
  def initialize(regexp) = @regexp = regexp
  def match(line) = line[@regexp, 1]
  def val(line) = match(line).to_i
  def next(question) = question.gsub(@regexp, '')
end

# class Add
class Add < Op
  def initialize = super(/^ plus (-?\d+)/)
  def eval(a, b) = a + b
end

# class Sub
class Sub < Op
  def initialize = super(/^ minus (-?\d+)/)
  def eval(a, b) = a - b
end

# class Mul
class Mul < Op
  def initialize = super(/^ multiplied by (-?\d+)/)
  def eval(a, b) = a * b
end

# class Div
class Div < Op
  def initialize = super(/^ divided by (-?\d+)/)
  def eval(a, b) = a / b
end

# class WordProblem
class WordProblem
  attr_reader :answer

  FIRST = /^(-?\d+)/
  OPS = [Add.new, Sub.new, Mul.new, Div.new].freeze
  def initialize(question)
    question = question.gsub(/^What is /, '')
    @answer = question[FIRST].to_i
    question = question.gsub(FIRST, '')
    while question != '?'
      op = OPS.find { _1.match(question) }
      raise ArgumentError, 'Invalid question' unless op

      @answer = op.eval(@answer, op.val(question))
      question = op.next(question)
    end
  end
end
