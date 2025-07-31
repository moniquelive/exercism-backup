enum LogLevel: Int {
    case trace, debug
    case info = 4
    case warning, error, fatal
    case unknown = 42

    func shortFormat(message: String) -> String {
        "\(self.rawValue):\(message)"
    }

    init(_ line: String) {
        self =
            switch line.prefix(5) {
            case "[TRC]": .trace
            case "[DBG]": .debug
            case "[INF]": .info
            case "[WRN]": .warning
            case "[ERR]": .error
            case "[FTL]": .fatal
            default: .unknown
            }
    }
}
