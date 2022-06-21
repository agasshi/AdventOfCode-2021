 import UIKit

let url = Bundle.main.url(forResource: "depth", withExtension: "txt")
let raw = try String(contentsOf: url!, encoding: String.Encoding.utf8)

var depth: [Int] = []
for item in raw.split(separator: "\n")
{
    if let value = Int(String(item)) {
        depth.append(value)
    }
}

//Day One - Part One
func distance(values: Array<Int>) -> Int
{
    if values.count <= 1 {
        return 0
    }
    
    if values[0] < values[1]  {
        return distance(values: Array(values.dropFirst())) + 1
    }
    else {
        return distance(values: Array(values.dropFirst()))
    }
}

print("There are \(distance(values: depth)) measurements that are larger than the previous measurement.")

//Day One - Part Two
func distance(values: Array<Int>, range: Int) -> Int
{
    if values.count < range+1 {
        return 0
    }
    
    let sumA = values[0..<range].reduce(0, +)
    let sumB = values[1...range].reduce(0, +)
    if sumA < sumB  {
        return distance(values: Array(values.dropFirst()), range: range) + 1
    }
    else {
        return distance(values: Array(values.dropFirst()), range: range)
    }
}

print("There are \(distance(values: depth, range: 3)) sum that are larger than the previous sum.")
