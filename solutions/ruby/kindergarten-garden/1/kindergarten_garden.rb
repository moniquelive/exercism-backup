# frozen_string_literal: true

# class Garden
class Garden
  STUDENTS = %i[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry].freeze
  STUDENTS.each_with_index { |student, index| define_method(student) { plants_for(index) } }
  def initialize(diagram) = @rows = diagram.lines(chomp: true)

  private

  PLANTS = { 'C' => :clover, 'G' => :grass, 'R' => :radishes, 'V' => :violets }.freeze
  def plants_for(index) = @rows.flat_map { |row| row[index * 2, 2].chars.map(&PLANTS) }
end
