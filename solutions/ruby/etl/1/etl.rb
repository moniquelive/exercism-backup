#
# ETL for scrabbles
#
module BookKeeping
  VERSION = 1
end

# module ETL
module ETL
  module_function

  def transform(old)
    old.each_with_object({}) do |(score, letters), retval|
      letters.each { |letter| retval[letter.downcase] = score }
    end
  end
end