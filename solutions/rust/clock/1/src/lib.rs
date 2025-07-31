use std::fmt;

#[derive(Debug, PartialEq, Eq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total = (hours * 60) + minutes;
        Clock {
            hours: hour_from_minutes(total),
            minutes: minute_from_minutes(total),
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock {
            hours: hour_from_minutes(self.in_minutes() + minutes),
            minutes: minute_from_minutes(self.in_minutes() + minutes),
        }
    }

    fn in_minutes(&self) -> i32 {
        (self.hours * 60) + self.minutes
    }
}

fn hour_from_minutes(total: i32) -> i32 {
    (total as f32 / 60.0).floor().rem_euclid(24.0) as i32
}

fn minute_from_minutes(total: i32) -> i32 {
    total.rem_euclid(60).rem_euclid(60)
}
