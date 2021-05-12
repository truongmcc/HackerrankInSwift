//: [Previous](@previous)

import Foundation
//https://www.hackerrank.com/challenges/mark-and-toys/problem
func maximumToys(prices: [Int], k: Int) -> Int {
    let tabPrices = prices.sorted().filter({ $0 <= k })
    print(tabPrices)
    var toysCount = 0
    var sum = 0
    for price in tabPrices {
        sum += price
        if sum < k {
            toysCount += 1
        } else { break }
    }
    return toysCount
}
//print(maximumToys(prices: [3, 7, 2, 9, 4], k: 15))

//https://www.hackerrank.com/challenges/two-arrays/problem
func twoArrays(k: Int, A: [Int], B: [Int]) -> String {
    let tabA = A.sorted()
    let tabB = Array(B.sorted().reversed())
    print(tabA)
    print(tabB)
    for i in 0...tabA.count - 1 {
        if tabA[i] + tabB[i] < k { return "NO" }
    }
    return "YES"
}
print(twoArrays(k: 10, A: [2, 1, 3], B: [7, 8, 9]))
