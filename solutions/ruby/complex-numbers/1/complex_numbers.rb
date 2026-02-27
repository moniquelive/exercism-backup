# frozen_string_literal: true

# class ComplexNumber
class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(real, imaginary = 0)
    @real = real.to_f
    @imaginary = imaginary.to_f
  end

  def abs()= Integer.sqrt(@real**2 + @imaginary**2)
  def conjugate = ComplexNumber.new(@real, -@imaginary)
  def exp = ComplexNumber.new(Math.exp(@real) * Math.cos(@imaginary), Math.exp(@real) * Math.sin(@imaginary))
  def ==(other) = (@real - other.real).abs < 1e-15 && (@imaginary - other.imaginary).abs < 1e-15
  def +(other) = ComplexNumber.new(@real + other.real, @imaginary + other.imaginary)
  def -(other) = ComplexNumber.new(@real - other.real, @imaginary - other.imaginary)

  def *(other) = ComplexNumber.new(@real * other.real - @imaginary * other.imaginary,
                                   @imaginary * other.real + @real * other.imaginary)

  def /(other) = ComplexNumber.new(
    (@real * other.real + @imaginary * other.imaginary) / (other.real**2 + other.imaginary**2),
    (@imaginary * other.real - @real * other.imaginary) / (other.real**2 + other.imaginary**2)
  )
end
