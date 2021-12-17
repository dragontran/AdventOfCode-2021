import Foundation

let lines = input.components(separatedBy: "\n")

let bingoCalls = lines
    .first?
    .components(separatedBy: ",")
    .compactMap { Int($0) } ?? []

var bingoCards = lines
    .dropFirst()
    .flatMap { $0.components(separatedBy: " ").compactMap{ Int($0) } }
    .map { ($0, false) }

let cardCount = bingoCards.count / 25
var bingos: [Int] = []

let horizontalRows = stride(from: 0, through: 20, by: 5).map { Range($0...$0+4).map { $0 } }
let verticalColumns = Range(0...4).map { stride(from: $0, through: $0 + 20, by: 5).map { $0 } }
for call in bingoCalls {
    var sum: Int?
    for (index, (value, _)) in bingoCards.enumerated() {
        guard value == call else { continue }
        bingoCards[index] = (value, true)
        let cardIndex = index % 25
        let cardNumber = index / 25
        let offset = cardNumber * 25
        
        let horizonal = horizontalRows
            .first { $0.contains(cardIndex) }?
            .map { bingoCards[offset + $0].1 } ?? []
        
        let vertical = verticalColumns
            .first { $0.contains(cardIndex) }?
            .map { bingoCards[offset + $0].1 } ?? []
        
        // bingo
        guard horizonal.allSatisfy({ $0 }) || vertical.allSatisfy({ $0 }) else { continue }
        
        guard
            !bingos.contains(cardNumber)
        else {
            continue
        }
        
        guard bingos.count == cardCount - 1 else {
            bingos.append(cardNumber)
            continue
        }
        
        sum = (cardNumber * 25..<(cardNumber * 25) + 25)
            .filter { !bingoCards[$0].1 }
            .map { bingoCards[$0].0 }
            .reduce(0, +)
        break
 
    }
    
    guard let sum = sum else { continue }
    print(sum * call)
    break
}
