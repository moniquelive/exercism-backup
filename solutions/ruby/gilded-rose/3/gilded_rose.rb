# frozen_string_literal: true

ITEM = {
  aged_brie: /Aged Brie/,
  backstage: /Backstage passes to a TAFKAL80ETC concert/i,
  sulfuras: /^Sulfuras, Hand of Ragnaros/,
  conjured: /Conjured/,
  conj_sulfuras: /Conjured Sulfuras/
}.freeze

Item = Struct.new(:name, :sell_in, :quality) do
  def dec_sell_in = self.sell_in -= 1
  def expired? = self.sell_in.negative?
  def add_quality(delta) = self.quality = (quality + delta).clamp(0, 50)
  def method_missing(msg) = msg.end_with?('?') ? (name =~ ITEM[msg.to_s.chop.to_sym]) : ITEM[msg]
  def respond_to_missing?(msg, _include_private) = msg.end_with?('?') || ITEM.keys.include?(msg)

  def tick
    case name
    when sulfuras, conj_sulfuras # pass
    when aged_brie then add_quality(1)
    when backstage
      add_quality(1) if self.sell_in <= 10
      add_quality(1) if self.sell_in <= 5
      add_quality(1) unless conjured?
    when conjured then add_quality(-2)
    else add_quality(-1)
    end
    dec_sell_in unless sulfuras? # sulfuras dont decay

    return unless expired?

    case name
    when sulfuras # pass
    when backstage, conjured then self.quality = 0
    when aged_brie then add_quality(1)
    else add_quality(-1)
    end
  end
end

# class GildedRose
class GildedRose
  def initialize(items) = @items = items
  def update! = @items.each(&:tick)
end
