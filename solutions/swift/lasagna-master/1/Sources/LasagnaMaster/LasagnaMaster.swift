func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: String...) -> Int { layers.count * 2 }

func quantities(layers: String...) -> (noodles: Double, sauce: Double) {
    (
        noodles: 3.0 * Double(layers.filter { $0 == "noodles" }.count),
        sauce: 0.2 * Double(layers.filter { $0 == "sauce" }.count)
    )
}

func toOz(_ amount: inout (noodles: Double, sauce: Double)) { amount.sauce *= 33.814 }

func redWine(layers: String...) -> Bool {
    let nMoz = layers.filter { $0 == "mozzarella" }.count
    let nRic = layers.filter { $0 == "ricotta" }.count
    let nBec = layers.filter { $0 == "béchamel" }.count
    let nSau = layers.filter { $0 == "sauce" }.count
    let nMea = layers.filter { $0 == "meat" }.count
    return nMoz + nRic + nBec <= nMea + nSau
}
