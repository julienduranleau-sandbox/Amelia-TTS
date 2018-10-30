use std::process::Command;

pub fn say(s: &str) {
    Command::new("./ibm-tts.sh")
        .arg(s)
        .output()
        .expect("failed to execute TTS process");
}

