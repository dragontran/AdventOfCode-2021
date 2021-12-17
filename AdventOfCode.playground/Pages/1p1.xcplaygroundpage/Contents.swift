//: [Previous](@previous)

import Foundation

var tempNumber: Int? = nil
var count = 0
sample.components(separatedBy: "\n").forEach {
    guard let number = tempNumber else {
        tempNumber = Int($0)
        return
    }
    
    guard let nextNumber = Int($0), nextNumber > number else {
        tempNumber = Int($0)
        return
    }
    
    tempNumber = Int($0)
    count=count+1
}

print(count)
