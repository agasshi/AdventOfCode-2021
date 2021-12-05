import UIKit

//
let url = Bundle.main.url(forResource: "depth", withExtension: "txt")
let raw = try String(contentsOf: url!, encoding: String.Encoding.utf8)

var depth: [Int] = []
for item in raw.split(separator: "\n")
{
    if let value = Int(String(item))
    {
        depth.append(value)
    }
}

func distance(values: Array<Int>, index: Int) -> Int
{
    if values.count <= index {
        return 0
    }
    if values[index-1] < values[index]  {
        return distance(values: values, index: index+1) + 1
    }
    else {
        return distance(values: values, index: index+1)
    }
}

print("Result : \(distance(values: depth, index: 1))")
