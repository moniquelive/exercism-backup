// This stub file contains items which aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

/// various log levels
#[derive(Clone, PartialEq)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
}

impl From<LogLevel> for &str {
    fn from(level: LogLevel) -> Self {
        match level {
            LogLevel::Info => &"INFO",
            LogLevel::Warning => &"WARNING",
            LogLevel::Error => &"ERROR",
        }
    }
}

/// primary function for emitting logs
pub fn log(level: LogLevel, message: &str) -> String {
    let s: &str = level.into();
    format!("[{}]: {}", s, message)
}
pub fn info(message: &str) -> String {
    log(LogLevel::Info, message)
}
pub fn warn(message: &str) -> String {
    log(LogLevel::Warning, message)
}
pub fn error(message: &str) -> String {
    log(LogLevel::Error, message)
}
