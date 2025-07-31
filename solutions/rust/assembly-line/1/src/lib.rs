pub fn production_rate_per_hour(speed: u8) -> f64 {
    let rate = [0.0, 1.0, 1.0, 1.0, 1.0, 0.9, 0.9, 0.9, 0.9, 0.77, 0.77];
    (speed as f64) * 221.0 * rate[speed as usize]
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    (production_rate_per_hour(speed).round() as u32) / 60
}
