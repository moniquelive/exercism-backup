class Scale
  @@pitches = {
    "A" => {
      lydian:  %w[A B C# D# E F# G#],
      pentatonic: %w[A B C# E F#]
    },
    "Bb" => {
      minor: %w[Bb C Db Eb F Gb Ab]
    },
    "C" => {
      chromatic: %w[C C# D D# E F F# G G# A A# B],
      major: %w[C D E F G A B],
      octatonic: %w[C D D# F F# G# A B]
    },
    "D" => {
      dorian:  %w[D E F G A B C],
      harmonic_minor: %w[D E F G A Bb Db]
    },
    "Db" => {
      hexatonic: %w[Db Eb F G A B]
    },
    "E" => {
      phrygian:  %w[E F G A B C D]
    },
    "Eb" => {
      mixolydian:  %w[Eb F G Ab Bb C Db]
    },
    "F" => {
      chromatic: %w[F Gb G Ab A Bb B C Db D Eb E]
    },
    "F#" => {
      minor: %w[F# G# A B C# D E]
    },
    "G" => {
      enigma: %w[G G# B C# D# F F#],
      locrian: %w[G Ab Bb C Db Eb F],
      major:  %w[G A B C D E F#]
    }
  }

  def initialize(note, scale, interval="")
    @note = note[0].upcase + note[1..]
    @scale = scale
    @interval = interval
  end

  def name
    "#{@note} #{@scale.to_s}"
  end

  def pitches
    @@pitches[@note][@scale]
  end
end
