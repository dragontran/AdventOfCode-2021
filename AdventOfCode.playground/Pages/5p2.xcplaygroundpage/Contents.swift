import Foundation

struct Point: Hashable {
    let x,y: Int
}

var data: [Point: Int] = [:]

let lines = input
    .components(separatedBy: "\n")
    .map {
        $0.replacingOccurrences(of: " ", with: "")
            .components(separatedBy: "->")
            .map { (coordinateString: String) -> Point in
                let coordinates = coordinateString.components(separatedBy: ",")
                return Point(x: Int(coordinates[0]) ?? 0, y: Int(coordinates[1]) ?? 0)
            }
    }

lines.forEach {
    let start = $0[0]
    let end = $0[1]
    
    
    // horizontal
    if start.x == end.x {
        Range(min(start.y,end.y)...max(end.y, start.y)).map { Point(x: start.x, y: $0) }.forEach {
            data[$0, default: 0] += 1
        }
    }
    
    // vertical
    if start.y == end.y {
        Range(min(start.x,end.x)...max(end.x, start.x)).map { Point(x: $0, y: start.y) }.forEach {
            data[$0, default: 0] += 1
        }
    }
    
    // diag
    if abs(start.x - end.x) == abs(start.y - end.y) {
        let slope = (end.y - start.y) / (end.x - start.x)
        
        Range(min(start.x,end.x)...max(end.x, start.x)).map {
            
            Point(x:$0, y: slope * ($0 - start.x) + start.y)
        }.forEach {
            data[$0, default: 0] += 1
        }
    }
}

print(data.filter { $0.value > 1 }.count)

