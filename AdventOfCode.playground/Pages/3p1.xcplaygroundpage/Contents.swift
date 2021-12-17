//: [Previous](@previous)

import Foundation

let lines = input.components(separatedBy: "\n")
var data: [Int: [String]] = [:]

for line in lines {
    for (index, test) in line.enumerated() {
        let string = String(test)
        guard let _ = data[index] else {
            data[index] = [string]
            continue
        }

        data[index]?.append(string)
    }
}

print(data)

var gammaRate = ""
var epilsonRate = ""
for index in 0..<lines[0].count {
    let values = data[index]!
    let dictionary = values.reduce(into: [:], { counts, number in
        counts[number, default: 0] += 1
    })
    
    print(dictionary)
    
    guard let zeroCount = dictionary["0"], let oneCount = dictionary["1"] else { continue }
    let zeroIsGreater = zeroCount > oneCount
    gammaRate.append(zeroIsGreater ? "0" : "1")
    epilsonRate.append(zeroIsGreater ? "1" : "0")
}


print(gammaRate)
print(epilsonRate)

if let gammaRate = Int(gammaRate, radix: 2), let epsilonRate = Int(epilsonRate, radix: 2) {
    print(gammaRate * epsilonRate)
}
