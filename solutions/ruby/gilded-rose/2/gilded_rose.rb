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
  def method_missing(method) = method.end_with?('?') ? (name =~ ITEM[method[0...-1].to_sym]) : super
  def respond_to_missing?(name, _include_private) = name.end_with?('?')

  def tick
    case name
    when ITEM[:sulfuras], ITEM[:conj_sulfuras] # pass
    when ITEM[:aged_brie] then add_quality(1)
    when ITEM[:backstage]
      add_quality(1) if self.sell_in <= 10
      add_quality(1) if self.sell_in <= 5
      add_quality(1) unless conjured?
    when ITEM[:conjured] then add_quality(-2)
    else add_quality(-1)
    end
    dec_sell_in unless sulfuras? # sulfuras dont decay

    return unless expired?

    case name
    when ITEM[:sulfuras] # pass
    when ITEM[:backstage], ITEM[:conjured] then self.quality = 0
    when ITEM[:aged_brie] then add_quality(1)
    else add_quality(-1)
    end
  end
end

# class GildedRose
class GildedRose
  def initialize(items) = @items = items
  def update! = @items.each(&:tick)
end
