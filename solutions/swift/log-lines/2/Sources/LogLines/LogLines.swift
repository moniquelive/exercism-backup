enum LogLevel: Int {
    case trace, debug
    case info = 4
    case warning, error, fatal
    case unknown = 42

    func shortFormat(message: String) -> String {
        "\(self.rawValue):\(message)"
    }

    init(_ line: String) {
        switch line.prefix(5) {
        case "[TRC]": self = .trace
        case "[DBG]": self = .debug
        case "[INF]": self = .info
        case "[WRN]": self = .warning
        case "[ERR]": self = .error
        case "[FTL]": self = .fatal
        default: self = .unknown
        }
    }
}
