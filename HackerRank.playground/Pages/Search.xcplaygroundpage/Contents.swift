import Foundation

func stringToArray(s: String) -> [Int] {
    let tab = s.components(separatedBy: " ")
    return tab.map {Int($0)!}
}
print(stringToArray(s: "12 52 87"))
let o = stringToArray(s: "12 52 87")
let s = o.map { String($0)}
print(s.joined())

// https://www.hackerrank.com/challenges/missing-numbers/problem
func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
    var dicoArr = [Int: Int]()
    var dicoBrr = [Int: Int]()
    var tabRes = [Int]()
    for num in brr.sorted() { dicoBrr[num, default: 0] += 1 }
    for num in arr.sorted() { dicoArr[num, default: 0] += 1 }
    for key in Set(brr).sorted() {
        if dicoBrr[key, default: 0] - dicoArr[key, default: 0] > 0 {
            tabRes.append(key)
        }
    }
    return tabRes
}
//print(missingNumbers(arr: [203, 204, 205, 206, 207, 208, 203, 204, 205, 206], brr: [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]))

//https://www.hackerrank.com/challenges/sherlock-and-array/problem
func balancedSums(arr: [Int]) -> String {
    var res = "NO"
    let subs1 = arr
    let subs2 = Array(arr.reversed())
    var index1 = 0
    var index2 = 0
    var sum1 = subs1[index1]
    var sum2 = subs2[index2]
    for _ in 0...arr.count - 1 {
        if sum1 == sum2 && arr.count - (index1 + index2) <= 1 {
            res = "YES"
            break
        }
        if sum1 <= sum2 {
            index1 += 1
            sum1 += subs1[index1]
        } else {
            index2 += 1
            sum2 += subs2[index2]
        }
    }
    return res
}
//https://www.youtube.com/watch?v=xPHJH8RL3mo&list=PLSIpQf0NbcCltzNFrOJkQ4J4AAjW3TSmA
func balancedSumsOptimized(arr: [Int]) -> String {
    var x = 0
    var sum = 0
    for a in arr {
        sum += a
    }
    
    for y in arr {
        if 2 * x == sum - y {
            return "YES"
        }
        x = x + y
    }
    return "NO"
}
//print(balancedSumsOptimized(arr: [1, 1, 4, 1, 1]))
//print(balancedSumsOptimized(arr: [2, 0, 0, 0]))

//https://www.hackerrank.com/challenges/icecream-parlor/problem
func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
    for i in 0...arr.count - 1 where arr[i] < m {
        let value = m - arr[i]
        if let searchValue = arr.lastIndex(of: value), i != searchValue {
            return [i + 1, searchValue + 1]
        }
    }
    return []
}


//print(icecreamParlor(m: 4, arr: [2, 2, 4, 3]))
//print(icecreamParlor(m: 6, arr: [1, 3, 4, 5, 6]))

//https://www.hackerrank.com/challenges/connected-cell-in-a-grid/problem
// DFS algorithm (deep first search)
func deepFirstSearch( matrix: inout [[Int]], _ i: Int, _ j: Int) -> Int {
    if i < 0 || j < 0 || i >= matrix.count || j >= matrix[i].count || matrix[i][j] == 0 { return 0 }
    var size = 1
    matrix[i][j] = 0
    for row in i-1...i+1 {
        for col in j-1...j+1 {
            if row != i || col != j {
                size += deepFirstSearch(matrix: &matrix, row, col)
            }
        }
    }
    return size
}

func connectedCell(matrix: [[Int]]) -> Int {
    var maxR = 0
    for i in 0..<matrix.count - 1 {
        for j in 0..<matrix[i].count - 1 {
            if matrix[i][j] == 1 {
                var m = matrix
                let size = deepFirstSearch(matrix: &m, i, j)
                maxR = max(size, maxR)
            }
        }
    }
    return maxR
}
//print(connectedCell(matrix: [[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 1, 0], [1, 0, 0, 0]]))

// https://www.hackerrank.com/challenges/pairs/problem
func pairs(k: Int, arr: [Int]) -> Int {
    let setArr = Set(arr)
    var setRes: Set<Int> = []
    for i in arr {
        setRes.insert(i + k)
    }
    return setArr.intersection(setRes).count
}
print(pairs(k: 2, arr: stringToArray(s:"1 5 3 4 2")))

