class House
  FULL = [
    {action: "",                 title: "the horse and the hound and the horn"},
    {action: "that belonged to", title: "the farmer sowing his corn"},
    {action: "that kept",        title: "the rooster that crowed in the morn"},
    {action: "that woke",        title: "the priest all shaven and shorn"},
    {action: "that married",     title: "the man all tattered and torn"},
    {action: "that kissed",      title: "the maiden all forlorn"},
    {action: "that milked",      title: "the cow with the crumpled horn"},
    {action: "that tossed",      title: "the dog"},
    {action: "that worried",     title: "the cat"},
    {action: "that killed",      title: "the rat"},
    {action: "that ate",         title: "the malt"},
    {action: "that lay in",      title: "the house that Jack built."}
  ]
  def self.recite
    12.times.map { |i| verse(i) }.join("\n")
  end

  def self.verse(index)
    verses = FULL.drop(FULL.size - index - 1)
    first = verses[0]
    rest = verses.drop(1)

    "This is #{first[:title]}\n" +
      (rest.empty? ? ""
       : rest.each_with_object([]) { |h, a| a << "#{h[:action]} #{h[:title]}" }
             .join("\n") + "\n"
      )
  end
end
