use std::time::{Duration};
use std::thread::sleep;

mod time;
mod tts;

fn main() {
    let one_second = Duration::from_millis(1000);

    tts::say("Hello Delfez!");

    loop {
        let t = time::now();
        println!("It is currently {}:{}:{}", t.hours, t.minutes, t.seconds);

        if t.hours == 10 && t.minutes == 15 && t.seconds == 0 {
            tts::say("Hello Delfez, it is now 10 15. Stephanie should be joining soon!");
        }

        if t.hours == 11 && t.minutes == 0 && t.seconds == 0 {
            tts::say("It is now 11 o clock");
        }

        //if t.seconds == 0 {
        //    tts::say(&format!("It is currently {}:{}", t.hours, t.minutes))
        //}
        
        sleep(one_second);
    }
}

