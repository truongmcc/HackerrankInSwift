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
        }
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
//print(twoArrays(k: 10, A: [2, 1, 3], B: [7, 8, 9]))

// https://www.hackerrank.com/challenges/angry-children/problem
func maxMin(k: Int, arr: [Int]) -> Int {
    let sortedArr = arr.sorted()
    var minus = arr.max()!
    var tab = [Int]()
    for i in 0...arr.count - 1 {
        if i + k - 1 <= arr.count - 1 {
            tab = Array(sortedArr[i...i + k - 1])
            let minimum = tab.last! - tab.first!
            if minimum == 0 { return minimum
            } else if minimum <= minus { minus = minimum }
        } else { break }
    }
    return minus
}
//print(maxMin(k: 5, arr: [4504,1520,5857,4094,4157,3902,822,6643,2422,7288,8245,9948,2822,1784,7802,3142,9739,5629,5413,7232]))
//print(maxMin(k: 2, arr: [1,2,1,2,1]))

//https://www.hackerrank.com/challenges/sherlock-and-minimax/problem
func sherlockAndMinimax(arr: [Int], p: Int, q: Int) -> Int {
    var tab = [p]
    var tabMin = [Int]()
    for i in 0..<q - p  {
        tab.append(tab[i] + 1)
    }
    print("tab: \(tab)")
    print("tab.count: \(tab.count)")
    for nb in tab {
        var minimum = min(nb, abs(arr[0] - nb))
        for value in arr {
            minimum = min(minimum, abs(value - nb))
            if minimum == 0 {
                continue
            }
        }
        tabMin.append(minimum)
    }
    print("tabMin: \(tabMin)")
    print("tabMin.count: \(tabMin.count)")
    print(tabMin.max()!)
    return tab[tabMin.firstIndex(of: tabMin.max()!)!]
}
//print(sherlockAndMinimax(arr: [46, 64, 26, 82, 18, 106, 60, 138, 194, 22], p: 82, q: 182))
print(sherlockAndMinimax(arr: [12, 10, 50, 24, 40], p: 9, q: 16))
//print(sherlockAndMinimax(arr: [30, 50, 60, 48], p: 23, q: 69))
//print(sherlockAndMinimax(arr: [3, 5, 7, 9], p: 6, q: 8))
