pub const Planet = enum {
    earth,
    mercury,
    venus,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    const one_year_in_seconds: f64 = 31_557_600;

    pub fn age(self: Planet, seconds: usize) f64 {
        const factor: f64 = switch (self) {
            .earth => 1.0,
            .mercury => 0.2408467,
            .venus => 0.61519726,
            .mars => 1.8808158,
            .jupiter => 11.862615,
            .saturn => 29.447498,
            .uranus => 84.016846,
            .neptune => 164.79132,
        };
        return @as(f64, @floatFromInt(seconds)) / one_year_in_seconds / factor;
    }
};
