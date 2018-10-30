use std::time::{SystemTime};

pub struct DayTime {
    pub hours: i64,
    pub minutes: i64,
    pub seconds: i64,
}

pub fn now() -> DayTime {
    
    let timezone_offset = -4 * 3600;

    let n = SystemTime::now()
        .duration_since(SystemTime::UNIX_EPOCH)
        .expect("Invalid SystemTime")
        .as_secs() as i64 + timezone_offset;

    let seconds_since_midnight = n % 86400;

    DayTime {
        hours: seconds_since_midnight / 3600,
        minutes: seconds_since_midnight % 3600 / 60,
        seconds: seconds_since_midnight % 3600 % 60,
    }
}

