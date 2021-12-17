import UIKit

let lines = sample.components(separatedBy: "\n").compactMap { Int($0) }

var temp: Int?
var count = 0
for (index, line) in lines.enumerated() {
    let first = index
    let secondIndex = index + 1
    let thirdIndex = index + 2
    print("\(index) \(secondIndex) \(thirdIndex)")
    
    guard first <= lines.count - 1 else {
        print("first broke")
        break
    }
    
    guard secondIndex <= lines.count - 1 else {
        print("second broke")

        break
    }
    
    guard thirdIndex <= lines.count - 1 else {
        print("third broke")
        break
    }
    
    
    let sum = line + lines[secondIndex] + lines[thirdIndex]
    print(sum)
    
    guard
        let old = temp,
        old < sum
    else {
        temp = sum
        continue
    }
    
    temp = sum
    count = count + 1
}

print(count)
