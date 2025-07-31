# frozen_string_literal: true

# Acronym class
class Acronym
  def self.abbreviate(str)
    str.split(/[ -]/)
       .map { _1[0] }
       .join
       .upcase
  end
end
