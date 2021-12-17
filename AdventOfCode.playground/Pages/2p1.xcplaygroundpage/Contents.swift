import Foundation

var horizontal = 0
var depth = 0

let lines = input.components(separatedBy: "\n")
for line in lines {
    let components = line.components(separatedBy: " ")
    print(components)
    guard let value = Int(components[1]) else { fatalError() }
    switch components[0] {
        case "forward":
            horizontal += value
        case "down":
            depth += value
        case "up":
            depth -= value
        default:
            fatalError()
    }
}

print(horizontal)
print(depth)

print(horizontal * depth)
