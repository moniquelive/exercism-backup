# frozen_string_literal: true

ITEM = {
  aged_brie: /Aged Brie/,
  backstage: /Backstage passes to a TAFKAL80ETC concert/i,
  sulfuras: /^Sulfuras, Hand of Ragnaros/,
  conjured: /Conjured/,
  conj_sulfuras: /Conjured Sulfuras/
}.freeze

Item = Struct.new(:name, :sell_in, :quality) do
  def inc_quality = self.quality = [quality + 1, 50].min
  def dec_quality = self.quality = [quality - 1, 0].max
  def dec_sell_in = self.sell_in -= 1
  def expired? = self.sell_in.negative?
  def conjured? = name =~ ITEM[:conjured]

  def tick
    case name
    when ITEM[:sulfuras], ITEM[:conj_sulfuras] # pass
    when ITEM[:aged_brie] then inc_quality
    when ITEM[:backstage]
      inc_quality if self.sell_in <= 10
      inc_quality if self.sell_in <= 5
      inc_quality unless conjured?
    when ITEM[:conjured]
      dec_quality
      dec_quality
    else
      dec_quality
    end
    dec_sell_in unless name =~ ITEM[:sulfuras]
  end

  def expired
    return unless expired?

    case name
    when ITEM[:sulfuras] # pass
    when ITEM[:backstage], ITEM[:conjured] then self.quality = 0
    when ITEM[:aged_brie] then inc_quality
    else
      dec_quality
    end
  end
end

# class GildedRose
class GildedRose
  def initialize(items) = @items = items

  def update! = @items.each do |item|
    item.tick
    item.expired
  end
end
