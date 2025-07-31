struct Position {
    var x: Int = 0
    var y: Int = 0

    mutating func moveTo(newX: Int, newY: Int) {
        x = newX
        y = newY
    }
}

struct Size {
    var width: Int = 80
    var height: Int = 60

    mutating func resize(newWidth: Int, newHeight: Int) {
        width = newWidth
        height = newHeight
    }
}

class Window {
    var title: String = "New Window"
    var screenSize: Size = Size(width: 800, height: 600)
    var size: Size = Size()
    var position: Position = Position()
    var contents: String? = nil

    func update(title: String) { self.title = title }
    func update(text: String?) { self.contents = text }

    func resize(to newSize: Size) {
        size.resize(
            newWidth: min(max(newSize.width, 1), screenSize.width - position.x),
            newHeight: min(max(newSize.height, 1), screenSize.height - position.y)
        )
    }

    func move(to newPosition: Position) {
        position.moveTo(
            newX: min(max(newPosition.x, 0), screenSize.width - size.width),
            newY: min(max(newPosition.y, 0), screenSize.height - size.height)
        )
    }

    func display() -> String {
        let c = contents ?? "[This window intentionally left blank]"
        let p = "\(position.x), \(position.y)"
        let s = "\(size.width) x \(size.height)"
        return "\(title)\nPosition: (\(p)), Size: (\(s))\n\(c)\n"
    }
}

let mainWindow: Window = {
    let window = Window()
    window.update(title: "Main Window")
    window.resize(to: Size(width: 400, height: 300))
    window.move(to: Position(x: 100, y: 100))
    window.update(text: "This is the main window")
    return window
}()
