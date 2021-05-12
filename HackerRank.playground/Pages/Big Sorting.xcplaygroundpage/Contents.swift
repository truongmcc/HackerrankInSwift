//: [Previous](@previous)

import Foundation

//https://www.hackerrank.com/challenges/big-sorting/problem
func bigSorting(unsorted: [String]) -> [String] {
    let start = CFAbsoluteTimeGetCurrent()
    let unsortedArr = Array(unsorted)
    let arrToInt = unsortedArr.map { Int64($0)! }
    let sorted = arrToInt.sorted()
    let result = sorted.map { String($0) }
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    print(result)
    return result
}
//print(bigSorting(unsorted: ["1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3"])) // not working : too long

func bigSorting2(unsorted: [String]) -> [String] {
    var arrToInt = [Int]()
    let start = CFAbsoluteTimeGetCurrent()
    for i in Array(unsorted) {
        arrToInt.append(Int(i)!)
    }
    for i in 0..<arrToInt.count - 1 {
        if arrToInt[i] > arrToInt[i + 1] {
            arrToInt.swapAt(i, i + 1)
        }
    }
    var result = [String]()
    for i in arrToInt {
        result.append(String(i))
    }
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    return result
}
//print(bigSorting2(unsorted: ["1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3"])) // time out aussi
//print(bigSorting2(unsorted: ["6", "31415926535897932384626433832795", "1", "3", "10", "3", "5"]))


func bigSorting3(unsorted: [String]) -> [String] {
    print(unsorted)
    var result = unsorted
    let start = CFAbsoluteTimeGetCurrent()
    for _ in 0..<result.count - 1 {
        for i in 0..<result.count - 1 {
            if result[i].count > result[i + 1].count {
                //result.swapAt(i, i + 1)
                let temp = result[i]
                result[i] = result[i + 1]
                result[i + 1] = temp
            } else if result[i].count == result[i + 1].count {
                //                if Int(result[i])! > Int(result[i + 1])! {
                //                    result.swapAt(i, i + 1)
                //                }
                //                ou bien :
                let wordX = Array(result[i])
                let wordY = Array(result[i + 1])
                
                for j in 0...wordX.count - 1 {
                    let letterX = Character(String(wordX[j])).asciiValue!
                    let letterY = Character(String(wordY[j])).asciiValue!
                    if letterX > letterY {
                        let temp = result[i]
                        result[i] = result[i + 1]
                        result[i + 1] = temp
                        //result.swapAt(i, i + 1)
                    }
                }
            }
        }
    }
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    return result
}
//print(bigSorting3(unsorted: ["6", "31415926535897932384626433832795", "1", "3", "10", "3", "5"]))
//print(bigSorting3(unsorted: ["1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3","1", "200", "150", "3"]))
//print(bigSorting3(unsorted: ["15", "2", "10", "3"]))

//https://www.hackerrank.com/challenges/insertionsort1/problem
func insertionSort1(n: Int, arr: [Int]) -> Void {
    let start = CFAbsoluteTimeGetCurrent()
    if arr.count < 1 {
        print("")
    }
    var res = arr
    let x = arr.last!
    for i in stride(from: res.count - 2 , through: 0, by: -1) {
        if res[i] > x {
            res[i+1] = res[i]
            print(res.map { String($0) }.joined(separator: " "))
        } else {
            res[i+1] = x
            print(res.map { String($0) }.joined(separator: " "))
            break
        }
    }
    if res.first! > x {
        res[0] = x
        print(res.map { String($0) }.joined(separator: " "))
    }
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
}
//insertionSort1(n: 5, arr: [2, 3, 4, 5, 6, 7, 8, 9, 10, 1])

//https://www.hackerrank.com/challenges/insertionsort2/problem?h_r=next-challenge&h_v=zen
func insertionSort2(n: Int, arr: [Int]) -> Void {
    let start = CFAbsoluteTimeGetCurrent()
    
    var res = arr
    for i in 1..<res.count {
        var j = i
        let value = res[i]
        while j >= 1 && res[j - 1] > value {
            res[j] = res[j - 1]
            j -= 1
        }
        res[j] = value
        print(res.map { String($0) }.joined(separator: " "))
    }
    
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
} // THE BEST SORT EVER
//insertionSort2(n: 5, arr: [2, 3, 4, 5, 6, 7, 8, 9, 10, 1])
//insertionSort2(n: 7, arr: [3, 4, 7, 5, 6, 2, 1])
//insertionSort2(n: 6, arr: [1, 4, 3, 5, 6, 2])

//https://www.hackerrank.com/challenges/runningtime/problem
func runningTime(arr: [Int]) -> Int {
    var res = arr
    var count = 0
    for i in 1..<res.count {
        var j = i
        let value = res[i]
        while j >= 1 && res[j - 1] > value {
            res[j] = res[j - 1]
            j -= 1
            count += 1
        }
        res[j] = value // pas de sorting
        print(res.map { String($0) }.joined(separator: " "))
    }
    return count
}
//print(runningTime(arr: [2, 1, 3, 1, 2]))

//https://www.hackerrank.com/challenges/countingsort1/problem
func countingSort(arr: [Int]) -> [Int] {
    var res = Array(repeating: 0, count: 100)
    for i in 0...arr.count - 1{
        res[i] = arr.filter{$0 == i}.count
    }
    return res
}
//print(countingSort(arr: [1, 1, 3, 2, 1]))

func countingSort2(arr: [Int]) -> [Int] {
    //let numberCases = arr.max()! + 1
    //print(numberCases)
    var res = Array(repeating: 0, count: 100)
    print(res)
    for i in arr { res[i] += 1 }
    return res
}
//print(countingSort2(arr: [63, 25, 73, 1, 98, 73, 56, 84, 86, 57, 16, 83, 8, 25, 81, 56, 9, 53, 98, 67, 99, 12, 83, 89, 80, 91, 39, 86, 76, 85, 74, 39, 25, 90, 59, 10, 94, 32, 44, 3 ,89, 30, 27, 79, 46, 96, 27, 32, 18, 21, 92, 69, 81, 40, 40, 34, 68, 78, 24, 87, 42, 69, 23, 41, 78, 22, 6, 90, 99, 89, 50, 30, 20, 1 ,43, 3, 70, 95, 33, 46, 44, 9, 69, 48, 33, 60, 65, 16, 82, 67, 61, 32, 21, 79, 75, 75, 13, 87, 70, 33]))
//print(countingSort2(arr: [1, 1, 3, 2, 1]))
//print(countingSort2(arr: [63, 54, 17, 78, 43, 70, 32, 97, 16, 94, 74, 18, 60, 61, 35, 83, 13, 56, 75, 52, 70, 12, 24, 37, 17, 0, 16, 64, 34, 81, 82, 24, 69, 2 ,30 ,61 ,83 ,37 ,97 ,16 ,70 ,53 ,0 ,61 ,12, 17, 97, 67, 33, 30, 49, 70, 11, 40, 67, 94, 84, 60, 35, 58, 19, 81, 16, 14, 68, 46, 42, 81, 75, 87, 13, 84, 33, 34, 14, 96, 7 ,59, 17, 98, 79, 47, 71, 75, 8, 27, 73, 66, 64, 12, 29, 35, 80, 78, 80, 6, 5, 24, 49, 82]))

//https://www.hackerrank.com/challenges/countingsort2/problem
func countingSort3(arr: [Int]) -> [Int] {
    return arr.sorted()
}
//print(countingSort3(arr: [1, 1, 3, 2, 1]))
//print(countingSort3(arr: [19, 10, 12, 10, 24, 25, 22]))

//https://www.hackerrank.com/challenges/closest-numbers/problem
func closestNumbers(arr: [Int]) -> [Int] {
   var result = [Int]()
   let sortedArr = Array(arr.sorted())
   print(sortedArr)
   var min = sortedArr.max()! - sortedArr.min()!
   for i in 0..<sortedArr.count - 1 {
       let difference = abs(sortedArr[i] - sortedArr[i + 1])
       if difference < min {
           result = [sortedArr[i], sortedArr[i + 1]]
           print(result)
           min = difference
       } else if difference == min {
           result.append(sortedArr[i])
           result.append(sortedArr[i + 1])
       }
       print(result)
       print(difference)
   }
   return result // pb time out
}
//print(closestNumbers(arr: [-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854 ]))
//print(closestNumbers(arr: [5,2,3,4,1]))

func closestNumbers2(arr: [Int]) -> [Int] {
   var result = [Int]()
   let sortedArr = Array(arr.sorted())
   var m = sortedArr.max()! - sortedArr.min()!
   print(sortedArr)
   for i in 0..<sortedArr.count - 1 {
       m = min(sortedArr[i+1] - sortedArr[i], m)
   }
   for i in 0..<sortedArr.count - 1 {
       if sortedArr[i + 1] - sortedArr[i] == m {
           result.append(sortedArr[i])
           result.append(sortedArr[i + 1])
       }
   }
   return result // plus optimal
}
//print(closestNumbers(arr: [-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854 ]))
//print(closestNumbers2(arr: [5,2,3,4,1]))

//https://www.hackerrank.com/challenges/find-the-median/problem
func findMedian(arr: [Int]) -> Int {
    let sortedArr = Array(arr.sorted())
    return (sortedArr[sortedArr.count / 2])
}

//https://www.hackerrank.com/challenges/quicksort1/problem
func quickSort(arr: [Int]) -> [Int] {
    var tabRes = arr
    var pivot = 0
    for i in 1...tabRes.count - 1 {
        if tabRes[i] < tabRes[pivot] {
            tabRes.insert(tabRes[i], at: 0)
            pivot += 1
            tabRes.remove(at: i + 1)
        }
    } 
    return tabRes
}
print(quickSort(arr: [4, 5, 3, 7, 2]))
