module BookKeeping
  VERSION = 1
end

#
module PhoneNumber
  module_function

  def clean(n)
    clean          = n.gsub(/\D/, '')
    clean          = (clean.length == 11 && clean[0] == '1') ? clean[-10..-1] : clean
    valid_digits   = (clean[0] =~ /^[2-9]/) && (clean[3] =~ /^[2-9]/)
    correct_length = (clean.length == 10)
    valid_digits && correct_length ? clean : nil
  end
end