module BookKeeping
  VERSION = 1
end

# PhoneNumber
module PhoneNumber
  module_function

  def clean(n)
    PhoneSanitizer.new(n).to_s
  end

  # PhoneSanitizer
  class PhoneSanitizer
    def initialize(number)
      @number = only_digits(number)
      @number = remove_international_code(@number)
    end

    def to_s
      sane_length? && sane_form? ? @number : nil
    end

    private

    def sane_length?
      @number.length == 10
    end

    def sane_form?
      @number =~ /^[2-9]\d\d[2-9]\d{6}$/
    end

    def remove_international_code(number)
      number.length == 11 && number[0] == '1' ? number[1..-1] : number
    end

    def only_digits(number)
      number.gsub(/\D/, '')
    end
  end
end