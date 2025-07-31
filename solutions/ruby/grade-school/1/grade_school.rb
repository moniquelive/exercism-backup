#
class School
  #
  def initialize
    @roster = Hash.new { |hash, key| hash[key] = [] }
  end

  def students(n)
    @roster[n].sort
  end

  def add(name, grade)
    @roster[grade] << name
  end

  def students_by_grade
    @roster.keys.sort.map do |grade|
      { grade: grade, students: students(grade) }
    end
  end
end

module BookKeeping
  VERSION = 3
end