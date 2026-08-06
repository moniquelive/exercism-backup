# frozen_string_literal: true

# module ZebraPuzzle
module ZebraPuzzle
  module_function

  HOUSES = (1..5).to_a.freeze
  ORDERS = HOUSES.permutation.to_a.freeze
  FIRST = 1
  MIDDLE = 3
  RESIDENTS = %i[englishman spaniard ukrainian norwegian japanese].freeze

  def water_drinker = solve[:water]
  def zebra_owner = solve[:zebra]
  def adjacent?(a, b) = (a - b).abs == 1

  def solve
    @solve ||= ORDERS.each do |red, green, ivory, yellow, blue|
      next unless green == ivory + 1

      ORDERS.each do |englishman, spaniard, ukrainian, norwegian, japanese|
        next unless englishman == red
        next unless norwegian == FIRST
        next unless adjacent?(norwegian, blue)

        ORDERS.each do |coffee, tea, milk, orange, water|
          next unless coffee == green
          next unless ukrainian == tea
          next unless milk == MIDDLE

          ORDERS.each do |dog, snails, fox, horse, zebra|
            next unless spaniard == dog

            ORDERS.each do |chess, dancing, painter, reading, football|
              next unless japanese == chess
              next unless snails == dancing
              next unless painter == yellow
              next unless football == orange
              next unless adjacent?(reading, fox)
              next unless adjacent?(painter, horse)

              by_house = RESIDENTS.zip([englishman,
                                        spaniard,
                                        ukrainian,
                                        norwegian,
                                        japanese]).to_h.invert

              return {
                water: by_house.fetch(water).to_s.capitalize,
                zebra: by_house.fetch(zebra).to_s.capitalize
              }
            end
          end
        end
      end
    end
  end
end
