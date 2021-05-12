
import Foundation

//https://www.hackerrank.com/challenges/time-conversion/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
func timeConversion(s: String) -> String {
    var hour = s
    hour.insert(" ", at: s.index(s.startIndex, offsetBy: 8))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh:mm:ss a"
    dateFormatter.locale = Locale(identifier: "fr_FR")
    guard let date = dateFormatter.date(from: hour) else { return "" }
    dateFormatter.dateFormat = "HH:mm:ss"
    let dateString = dateFormatter.string(from: date)
    return dateString
}
//print(timeConversion(s: "07:05:45PM"))

//https://www.hackerrank.com/challenges/a-very-big-sum/problem?h_r=next-challenge&h_v=zen
func aVeryBigSum(ar: [Int]) -> Int {
    var res = 0
    if 1 <= ar.count && ar.count <= 10 {
        res = ar.filter {
            Float($0) >= 0 && Float($0) <= Float($0)
        }.reduce(0,+)
    }
    return res
}
//print(aVeryBigSum(ar: [1, 2, 3]))

//https://www.hackerrank.com/challenges/diagonal-difference/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
func diagonalDifference(arr: [[Int]]) -> Int {
    func constraintRange(value: Int) -> Bool {
        return -100 <= value && value <= 100
    }
    
    var res1 = 0
    var res2 = 0
    
    for i in 0...arr.count - 1 {
        let element = arr[i]
        let k = arr.count - (i + 1)
        let reversedElement = arr[k]
        for j in i...element.count - 1 {
            if constraintRange(value: element[j]) {
                res1 = res1 + element[j]
                res2 = res2 + reversedElement[j]
                break
            }
        }
        
    }
    // solution moins optimisée :
    //    for i in stride(from: arr.count - 1, through: 0, by: -1){
    //        var element = arr[i]
    //        element.reverse()
    //        for j in i...element.count - 1 {
    //            if constraintRange(value: element[j]) {
    //                res2 = res2 + element[j]
    //                break
    //            }
    //        }
    //    }
    print(res1)
    print(res2)
    return abs(res1 - res2)
}
//print(diagonalDifference(arr: [[1, 2, 3],[4, 5, 6],[9, 8, 9]]))

//https://www.hackerrank.com/challenges/plus-minus/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
func plusMinus(arr: [Int]) -> Void {
    let denominator = arr.count
    let positiveCount = arr.filter {
        Double($0).sign != .minus && $0 != 0
    }.count
    
    let positiveRatio = Float64(positiveCount) / Float64(denominator)
    
    
    let negativeCount = arr.filter {
        Double($0).sign == .minus
    }.count
    
    let negativeRatio = Float64(negativeCount) / Float64(denominator)
    
    let zeroCount = arr.filter {
        $0 == 0
    }.count
    
    let zeroRatio = Float64(zeroCount) / Float64(denominator)
    
    print(positiveRatio)
    print(negativeRatio)
    print(zeroRatio)
}
//plusMinus(arr: [-4, 3, -9, 0, 4, 1])

// https://www.hackerrank.com/challenges/staircase/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
func staircase(n: Int) -> Void {
    let space = " "
    let dieze = "#"
    if 0 < n && n <= 100 {
        var line = ""
        for i in 1...n {
            let numberSpace = n - i
            let numberDieze = i
            var j = numberSpace
            while j > 0 {
                if numberSpace > 0 {
                    line = line + space
                }
                j = j - 1
            }
            
            for _ in 1...numberDieze {
                line = line + dieze
            }
            line = line + "\n"
        }
        print(line)
    }
}
//staircase(n: 6)

//https://www.hackerrank.com/challenges/mini-max-sum/problem?h_r=next-challenge&h_v=zen
func miniMaxSum(arr: [Int64]) -> Void {
    var sumArray = [Int]()
    if arr.count == 5 {
        for i in 0...arr.count - 1 {
            var fourArray = arr
            fourArray.remove(at: i)
            let sum = fourArray.reduce(0,+)
            sumArray.append(Int(sum))
        }
        let min = sumArray.min()!
        let max = sumArray.max()!
        print("\(min) \(max)")
    }
}
//miniMaxSum(arr: [1, 3, 5, 7, 9])

//https://www.hackerrank.com/challenges/birthday-cake-candles/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
func birthdayCakeCandles(candles: [Int]) -> Int {
    return candles.filter { $0 == candles.max() }.count
}
//print(birthdayCakeCandles(candles: [4, 4, 1, 3]))

func birthdayCakeCandles2(candles: [Int]) -> Int {
    return candles.reduce(0, { partialResult, nextElement in
        if nextElement == candles.max() {
            return partialResult + 1
        } else {
            return partialResult + 0
        }
    } )
}
//print(birthdayCakeCandles2(candles: [4, 4, 1, 3]))

