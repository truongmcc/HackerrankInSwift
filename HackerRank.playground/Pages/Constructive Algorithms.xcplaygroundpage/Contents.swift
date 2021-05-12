//: [Previous](@previous)

import Foundation

//https://www.hackerrank.com/challenges/an-interesting-game-1/problem
func gamingArray(arr: [Int]) -> String {
    var tabArr = arr
    var count = 0
    while !tabArr.isEmpty {
        let index = arr.firstIndex(of: tabArr.max()!)
        tabArr.removeSubrange(index!...tabArr.count - 1)
        print(tabArr)
        count += 1
        print(count)
    }
    print(tabArr)
    if count % 2 != 0 { return ("BOB") } else { return "ANDY" }
}
func gamingArray2(arr: [Int]) -> String { // optimized
    var count = 0
    var m = 0
    for i in arr {
        if i > m {
            m = i
            count += 1
        }
    }
    if count % 2 != 0 { return ("BOB") } else { return "ANDY" }
}
print(gamingArray2(arr: [2, 3, 5, 4, 1]))
