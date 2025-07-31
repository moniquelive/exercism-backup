class SpaceAge {
  let seconds: Double
  init(_ seconds: Double) { self.seconds = seconds / (60 * 60 * 24 * 365.25) }

  var onEarth: Double { seconds }
  var onMercury: Double { seconds / 0.2408467 }
  var onVenus: Double { seconds / 0.61519726 }
  var onMars: Double { seconds / 1.8808158 }
  var onJupiter: Double { seconds / 11.862615 }
  var onSaturn: Double { seconds / 29.447498 }
  var onUranus: Double { seconds / 84.016846 }
  var onNeptune: Double { seconds / 164.79132 }
}
