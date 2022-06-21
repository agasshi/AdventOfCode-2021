 import UIKit

let url = Bundle.main.url(forResource: "course", withExtension: "txt")
let raw = try String(contentsOf: url!, encoding: String.Encoding.utf8)

var command: [String] = []
for item in raw.split(separator: "\n")
{
    command.append(String(item))
}

//Day Two - Part One
func calculateWithPosition(values: Array<String>) -> Int
{
    var horizontal = 0
    var depth = 0
    for item in values
    {
        let split = item.split(separator: " ")
        if split.count < 2 {
            continue
        }
        
        guard let value = Int(split[1]) else {
            continue
        }
        
        switch split[0]
        {
            case "forward": horizontal += value
            case "up": depth -= value
            case "down": depth += value
            default: horizontal += 0
        }
    }
    
    return horizontal * depth
}

print("Multiplying these together produces \(calculateWithPosition(values: command)).")

//Day Two - Part Two
func calculateWithAim(values: Array<String>) -> Int
{
    var aim = 0
    var horizontal = 0
    var depth = 0
    
    for item in values
    {
        let split = item.split(separator: " ")
        if split.count < 2 {
            continue
        }
        
        guard let value = Int(split[1]) else {
            continue
        }
        
        switch split[0]
        {
            case "forward":
                horizontal += value
                depth += aim * value
            case "up":
                aim -= value
            case "down":
                aim += value
            default:
                horizontal += 0
        }
    }
    
    return horizontal * depth
}

print("Multiplying these together produces \(calculateWithAim(values: command)).")
