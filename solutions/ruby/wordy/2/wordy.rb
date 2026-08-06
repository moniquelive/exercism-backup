# frozen_string_literal: true

# class WordProblem
class WordProblem
  attr_reader :answer

  def initialize(question)
    @answer = eval question
              .delete_prefix('What is ')
              .delete_suffix('?')
              .gsub(' plus ', ' + ')
              .gsub(' minus ', ' - ')
              .gsub(' multiplied by ', ' * ')
              .gsub(' divided by ', ' / ')
              .gsub(/\S+ \S \S+/) { eval _1 }
  rescue SyntaxError, NameError
    raise ArgumentError, 'Invalid question'
  end
end
