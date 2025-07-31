#[derive(Debug)]
pub struct Clock {
    minutes: i32,
}

impl std::fmt::Display for Clock {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:02}:{:02}", self.hour(), self.minute())
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.hour() == other.hour() && self.minute() == other.minute()
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        const ONE_HOUR: i32 = 60;
        Clock {
            minutes: (hours * ONE_HOUR) + minutes,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock {
            minutes: self.minutes + minutes,
        }
    }

    fn hour(&self) -> i32 {
        const MAX_SECONDS: f32 = 60.0;
        const MAX_HOURS: f32 = 24.0;
        (self.minutes as f32 / MAX_SECONDS)
            .floor()
            .rem_euclid(MAX_HOURS) as i32
    }

    fn minute(&self) -> i32 {
        const MAX_SECONDS: i32 = 60;
        self.minutes.rem_euclid(MAX_SECONDS)
    }
}
