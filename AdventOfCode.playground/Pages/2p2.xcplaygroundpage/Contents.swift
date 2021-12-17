import Foundation

var horizontal = 0
var depth = 0
var aim = 0

let lines = input.components(separatedBy: "\n")
for line in lines {
    let components = line.components(separatedBy: " ")
    print(components)
    guard let value = Int(components[1]) else { fatalError() }
    switch components[0] {
        case "forward":
            horizontal += value
            depth += aim * value
        case "down":
            aim += value
        case "up":
            aim -= value
        default:
            fatalError()
    }
}

print(horizontal)
print(depth)

print(horizontal * depth)

