import UIKit
import CoreFoundation

func eliminateAdjacentEqualNumbers(numbers: [Int]) -> [Int] {
    let filtered = numbers.reduce(into: [Int]()) { partialResult, nextElement in
        if partialResult.last != nextElement { partialResult.append(nextElement) }
    }
    return filtered
}
//print(eliminateAdjacentEqualNumbers(numbers: [1, 1, 2, 2, 2, 3, 4, 4, 5, 4, 3]))






































