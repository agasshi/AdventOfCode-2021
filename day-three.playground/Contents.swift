 import UIKit

let url = Bundle.main.url(forResource: "diagnostic", withExtension: "txt")
let raw = try String(contentsOf: url!, encoding: String.Encoding.utf8)

var report: [String] = []
for item in raw.split(separator: "\n")
{
    report.append(String(item))
}

//Day Three - Part One
func calculatePowerConsumption(values: Array<String>) -> Int
{
    var sumZero: [Int] = []
    var sumOne: [Int] = []
    
    for item in values
    {
        let characters = Array(item)
        for i in characters.indices
        {
            if sumZero.count <= i {
                sumZero.append(0)
            }
            if sumOne.count <= i {
                sumOne.append(0)
            }
            
            switch characters[i]
            {
                case "0": sumZero[i] += 1
                case "1": sumOne[i] += 1
                default: sumZero[i] += 0
            }
        }
    }
    
    var gamma = ""
    var epsilon = ""
    
    for i in sumZero.indices
    {
        if sumZero[i] < sumOne[i] {
            gamma.append("1")
            epsilon.append("0")
        }
        else {
            gamma.append("0")
            epsilon.append("1")
        }
    }
    
    guard let gamma = Int(gamma, radix: 2), let epsilon = Int(epsilon, radix: 2) else {
        return 0
    }
    
    return gamma * epsilon
}

print("The power consumption of the submarine is \(calculatePowerConsumption(values: report)).")

//Day Three - Part Two
func calculateLifeSupportRating(values: Array<String>) -> Int
{
    let oxygen = foundOxygenGeneratorRating(values: values)
    let carbon = foundCarbonScrubberRating(values: values)
    return oxygen * carbon
}

func foundOxygenGeneratorRating(values: Array<String>) -> Int
{
    var position = 0
    var items = values
    
    while items.count > 1, let bit = foundMostCommonBit(values: items, index: position)
    {
        items = items.filter { String($0[$0.index($0.startIndex, offsetBy: position)]) == bit }
        position += 1
    }
    
    guard let result = Int(items[0], radix: 2) else {
        return 0
    }
    
    return result
}

func foundMostCommonBit(values: Array<String>, index: Int = 0) -> String?
{
    var sumZero = 0
    var sumOne = 0
    
    for item in values
    {
        let characters = Array(item)
        if characters.count <= index {
            continue
        }
        
        switch characters[index]
        {
            case "0": sumZero += 1
            case "1": sumOne += 1
            default: sumZero += 0
        }
    }
    
    if sumZero == 0 && sumOne == 0 {
        return nil
    }
    else if sumZero > sumOne {
        return "0"
    }
    else {
        return "1"
    }
}

func foundCarbonScrubberRating(values: Array<String>) -> Int
{
    var position = 0
    var items = values
    
    while items.count > 1, let bit = foundLessCommonBit(values: items, index: position)
    {
        items = items.filter { String($0[$0.index($0.startIndex, offsetBy: position)]) == bit }
        position += 1
    }
    
    guard let result = Int(items[0], radix: 2) else {
        return 0
    }
    
    return result
}

func foundLessCommonBit(values: Array<String>, index: Int = 0) -> String?
{
    var sumZero = 0
    var sumOne = 0
    
    for item in values
    {
        let characters = Array(item)
        if characters.count <= index {
            continue
        }
        
        switch characters[index]
        {
            case "0": sumZero += 1
            case "1": sumOne += 1
            default: sumZero += 0
        }
    }
    
    if sumZero == 0 && sumOne == 0 {
        return nil
    }
    else if sumZero > sumOne {
        return "1"
    }
    else {
        return "0"
    }
}

print("The life support rating of the submarine is \(calculateLifeSupportRating(values: report)).")

