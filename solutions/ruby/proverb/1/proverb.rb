class Proverb
  def initialize(*args, **kwargs)
    @words = args
    @qualifier = kwargs.fetch(:qualifier, "")
  end

  def to_s
    verses = @words.each_cons(2).map { |w1, w2|
      "For want of a #{w1} the #{w2} was lost."
    }
    conclusion = [@qualifier, @words.first].join(' ').strip
    verses.join("\n") + "\nAnd all for the want of a #{conclusion}."
  end
end
