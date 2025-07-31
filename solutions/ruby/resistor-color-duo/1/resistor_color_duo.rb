# frozen_string_literal: true

# ResistorColorDuo
module ResistorColorDuo
  def self.value(colors)
    h = Hash[%w[black brown red orange yellow green blue violet grey white].zip(0..)]
    h[colors[0]]*10 + h[colors[1]]
  end
end
