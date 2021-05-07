import UIKit
import CoreFoundation

// permutation lexicographique
//https://www.hackerrank.com/challenges/bigger-is-greater/problem
//It must be greater than the original word
//It must be the smallest word that meets the first condition
func biggerIsGreater(w: String) -> String {
    var asciiTab = Array(w).map {
        $0.asciiValue!
    }
    print(asciiTab)
    for i in 0...asciiTab.count - 1 {
        if asciiTab[i] < asciiTab[i+1]
        {
            let element = asciiTab.remove(at: i + 1)
            print(asciiTab)
            asciiTab.insert(element, at: i)
            print(asciiTab)
            break
        }
    }
    print(asciiTab)
    let res = asciiTab.map {
        Character(UnicodeScalar($0))
    }
    return (String(res))
}
//print(biggerIsGreater(w: "dhkc"))

//https://www.hackerrank.com/challenges/compare-the-triplets/problem
func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var res = [0, 0]
    for i in 0...a.count - 1 {
        if a[i] > b[i] {
            res[0]  = res[0] + 1
        } else if a[i] < b[i] {
            res[1] = res[1] + 1
        }
    }
    return res
}
//print(compareTriplets(a: [17, 28, 30], b: [99, 16, 8]))

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

func eliminateAdjacentEqualNumbers(numbers: [Int]) -> [Int] {
    let filtered = numbers.reduce(into: [Int]()) { partialResult, nextElement in
        //print(partialResult.last as Any)
        //print(nextElement)
        if partialResult.last != nextElement { partialResult.append(nextElement) }
    }
    return filtered
}
//print(eliminateAdjacentEqualNumbers(numbers: [1, 1, 2, 2, 2, 3, 4, 4, 5, 4, 3]))

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

//https://www.hackerrank.com/challenges/grading/problem
func gradingStudents(grades: [Int]) -> [Int] {
    return grades.map {
        let roundedNote = 5 * (($0 / 5) + 1)
        if $0 < 38 ||  $0 % 5 == 0  || roundedNote - $0 >= 3 {
            return $0
        } else {
            return roundedNote
        }
    }
}
//print(gradingStudents(grades: [73, 75, 67, 38, 33]))

//https://www.hackerrank.com/challenges/apple-and-orange/problem?h_r=next-challenge&h_v=zen
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    let nbApples = apples.map {
        return a + $0
    }.filter {
        s <= $0 && $0 <= t
    }.count
    
    let nbOranges = oranges.map {
        return b + $0
    }.filter {
        s <= $0 && $0 <= t
    }.count
    
    print("\(nbApples)\n\(nbOranges)")
}
//countApplesAndOranges(s: 7, t: 11, a: 5, b: 15, apples: [-2, 2, 1], oranges: [5, -6])

//https://www.hackerrank.com/challenges/kangaroo/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    var res = "NO"
    var posX1 = x1
    var posX2 = x2
    
    if 1 > v1 && v1 > 1000 || 1 > v2 && v2 > 1000 {
        return res
    }
    while res == "NO" && 0 <= max(posX1, posX2) && max(posX1, posX2) <= 1000 {
        posX1 += v1
        posX2 += v2
        print(posX1)
        print(posX2)
        res = posX1 == posX2 ? "YES" : "NO"
    }
    return res
}
//print(kangaroo(x1: 4, v1: 5, x2: 2, v2: 3))
//print(kangaroo(x1: 0, v1: 3, x2: 4, v2: 2))

// https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem
func breakingRecords(scores: [Int]) -> [Int] {
    var result = [Int]()
    var precedScore = scores[0]
    var highScoreNumber = 0
    let highestScore = scores.reduce(highScoreNumber) { _, currentElement in
        if currentElement > precedScore {
            highScoreNumber += 1
            precedScore = currentElement
        }
        return highScoreNumber
    }
    var lowScoreNumber = 0
    precedScore = scores[0]
    let lowestScore = scores.reduce(lowScoreNumber) { _, currentElement in
        if currentElement < precedScore {
            lowScoreNumber += 1
            precedScore = currentElement
        }
        return lowScoreNumber
    }
    result.append(highestScore)
    result.append(lowestScore)
    return result
}
//print(breakingRecords(scores: [10, 5, 20, 20, 10, 4, 5, 2, 25, 1]))
//print(breakingRecords(scores: [3, 4, 21, 36, 10, 28, 35, 5, 24, 42]))

//https://www.hackerrank.com/challenges/the-birthday-bar/problem
func birthday(s: [Int], d: Int, m: Int) -> Int {
    var res = 0
    let chocBar = s
    var sum = 0
    for i in 0...chocBar.count - 1 {
        sum = chocBar[i]
        if m > 1 {
            var j = i
            for _ in 1...m - 1{
                if j+1 < chocBar.count && m > 1 {
                    sum += chocBar[j+1]
                    j = j+1
                }
            }
        }
        if sum == d {
            res += 1
        }
    }
    return res
}
//print(birthday(s: [4, 1], d: 4, m: 1))

//https://www.hackerrank.com/challenges/divisible-sum-pairs/problem?h_r=next-challenge&h_v=zen
func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    var numbersOfPairs = 0
    for i in 0...n-2 {
        var j = i
        for _ in i+1...n-1 {
            j += 1
            print("\(ar[i]) \(ar[j])")
            if (ar[i] + ar[j]) % k == 0 {
                numbersOfPairs += 1
            }
        }
    }
    return numbersOfPairs
}
//print(divisibleSumPairs(n: 6, k: 3, ar: [1, 3, 2, 6, 1, 2]))

//https://www.hackerrank.com/challenges/migratory-birds/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
func migratoryBirds(arr: [Int]) -> Int {
    //var counts: [Int: Int] = [:]
    //    arr.forEach {
    //        counts[$0, default: 0] += 1
    //    }
    //    let counts3 = arr.reduce(into: [:]) {
    //        $0[$1, default: 0] += 1
    //    }
    let dicoOccurences = arr.reduce(into: [:]) { partialResult, current in
        partialResult[current, default: 0] += 1
    }
    
    var arrayValue = [Int]()
    for (_, value) in dicoOccurences {
        arrayValue.append(value)
    }
    let max = arrayValue.max(by: {
        $0 < $1
    })
    
    var arrayIndex = [Int]()
    for (key, value) in dicoOccurences {
        if value == max {
            arrayIndex.append(key)
        }
    }
    
    return arrayIndex.min(by: { $0 < $1 }) ?? 0
}
//print(migratoryBirds(arr: [1, 4, 4, 4, 5, 3]))
//print(migratoryBirds(arr: [2, 4, 3, 2, 3, 1, 2, 1, 3, 3]))
//print(migratoryBirds(arr: [1, 2, 3, 4, 5, 4, 3, 2, 1, 3, 4]))
func migratoryBirds2(arr: [Int]) -> Int {
    let dicoOccurences = arr.reduce(into: [:]) { partialResult, current in
        partialResult[current, default: 0] += 1
    }
    return dicoOccurences.filter {
        $0.value == dicoOccurences.values.max()
    }.max {
        $0.key > $1.key
    }?.key ?? 0
}
//migratoryBirds2(arr: [1, 2, 3, 4, 5, 4, 3, 2, 1, 3, 4])

// https://www.hackerrank.com/challenges/extra-long-factorials/problem
func extraLongFactorials(n: Int) -> Void {
    var res: Int = n
    var x: Int = n
    for _ in 1...n - 1  {
        res = res * (x - 1)
        x = x - 1
    }
    print(res)
}
//extraLongFactorials(n: 20)

func extraLongFactorials2(n: Int) -> Void {
    var res = 1
    for i in 1...n {
        res = res * i
    }
    print(res)
}
//extraLongFactorials2(n: 20)

func extraLongFactorials3(n: Int) -> Void {
    var res = 1
    for i in stride(from: n, to: 0, by: -1) {
        res = res * i
    }
    print(res)
}
//extraLongFactorials3(n: 20)

//https://www.hackerrank.com/challenges/extra-long-factorials/problem?h_r=next-challenge&h_v=zen
func extraLongFactorials4(n: Int) -> Void {
    var numb = n - 1
    var count = 0
    var res = n
    for _ in 1...n - 1 {
        print("numb: \(numb)")
        res = res * numb
        if res > 10 && res % 10 == 0 {
            res = res / 10
            count += 1
        }
        print("res: \(res)")
        numb -= 1
    }
    print("fini")
    print(res)
    print("count: \(count)")
    var zeros = ""
    for _ in 0...count - 1 {
        zeros += "0"
    }
    print(String(res) + zeros)
}
//extraLongFactorials4(n: 23) // not working over 23

// https://www.hackerrank.com/challenges/drawing-book/problem
func pageCount(n: Int, p: Int) -> Int {
    var resFromFront = 0
    var resFromBack = 0
    var pagesFromFront = 1
    var pagesFromBack = n
    if p == 1 || p == n || (n % 2 == 1 && p == n - 1) {
        return 0
    } else if n - 1 == p || n - 2 == p {
        return 1
    } else {
        while pagesFromFront != p && (pagesFromFront - 1) != p &&
                pagesFromBack != p && (pagesFromBack - 1) != p {
            resFromFront += 1
            resFromBack += 1
            pagesFromFront += 2
            pagesFromBack -= 2
        }
    }
    return min(resFromFront, resFromBack)
}
//print(pageCount(n: 8, p: 6))

//https://www.hackerrank.com/challenges/counting-valleys/problem?h_r=next-challenge&h_v=zen
// calcule le nombre de vallées traversées
func countingValleys(steps: Int, path: String) -> Int {
    var numberOfValleys = 0
    var goDown = false
    var goUp = false
    let pathNumbers = Array(path)
        .map { $0 == "U" ? 1 : -1 }
    let _ = pathNumbers
        .reduce(into: [0]) { partialResult, current in
            let newValue = current + partialResult.last!
            partialResult.append(newValue)
            if newValue == -1 && goDown == false {
                goDown = true
            } else if goDown == true && newValue == 0 {
                goUp = true
            }
            if goDown && goUp {
                numberOfValleys += 1
                goDown = false
                goUp = false
            }
        }
    return numberOfValleys
}
//print(countingValleys(steps: 8, path: "UDDDUDUU")) // expected 1
//print(countingValleys(steps: 12, path: "DDUUDDUDUUUD")) // expected 2
//print(countingValleys(steps: 10, path: "UDUUUDUDDD")) // expected 0

//https://www.hackerrank.com/challenges/picking-numbers/problem
// j'avais pas compris l'énoncé (voir soluce dans commentaires)
func pickingNumbers(a: [Int]) -> Int {
    var frequency = Array(repeating: 0, count: 101)
    var result = 0
    let sortedA = a.sorted()
    for i in 0...a.count - 1 {
        frequency[sortedA[i]] = frequency[sortedA[i]] + 1
    }
    for i in 1...100 {
        result = max(result, frequency[i] + frequency[i-1])
    }
    return result
}
//print(pickingNumbers(a: [98, 3, 99, 1, 97, 2]))
//print(pickingNumbers(a: [4, 6, 5, 3, 3, 1]))
//print(pickingNumbers(a: [1, 1, 2, 2, 4, 4, 5, 5, 5]))
//print(pickingNumbers(a: [98, 3, 99, 1, 97, 2]))
//print(pickingNumbers(a: [7, 12, 13, 19, 17, 7, 3, 18, 9, 18, 13, 12, 3, 13, 7 ,9, 18, 9 ,18 ,9, 13, 18, 13, 13, 18, 18, 17, 17, 13, 3 ,12 ,13 ,19 ,17 ,19 ,12 ,18 ,13 ,7 ,3 ,3, 12, 7, 13 ,7 ,3 ,17, 9, 13, 13, 13, 12, 18, 18, 9, 7, 19, 17, 13, 18, 19, 9, 18, 18, 18, 19, 17, 7, 12, 3, 13, 19, 12, 3, 9, 17, 13, 19, 12, 18, 13, 18, 18, 18, 17, 13, 3 ,18, 19, 7 ,12 ,9 ,18, 3 ,13, 13, 9, 7]))
//print(pickingNumbers(a: [66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66]))

func pickingNumbersFonctionalVersion(a: [Int]) -> Int {
    var result = 0
    a.sorted()
        .reduce(into: Array(repeating: 0, count: 101)) { partialResult, current in
            partialResult[current] = partialResult[current] + 1
        }.reduce(into: [0], { nextPartialResult, current in
            result = max(result, current + nextPartialResult.last!)
            nextPartialResult.append(current)
        })
    return result
}
//print(pickingNumbersFonctionalVersion(a: [98, 3, 99, 1, 97, 2]))
//print(pickingNumbersFonctionalVersion(a: [4, 6, 5, 3, 3, 1]))

//https://www.hackerrank.com/challenges/repeated-string/problem
func repeatedString(s: String, n: Int) -> Int {
    var infiniteString = ""
    var nbLoop: Int
    if n / s.count == n {
        nbLoop = n
    } else {
        nbLoop = n/s.count + 1
    }
    for _ in 1...nbLoop {
        infiniteString += s
    }
    // couper au bon endroit la chaine
    infiniteString = String(infiniteString.prefix(10))
    // compter les occurences
    let occurrencesDico = Array(infiniteString).reduce(into: [:]) { partialResult, current in
        partialResult[current, default: 0] += 1
    }
    guard let occurrencesOfa = occurrencesDico["a"] else {
        return 0
    }
    return occurrencesOfa
}
//print(repeatedString(s: "aba", n: 10))
//print(repeatedString(s: "a", n: 10000000000)) // pb : trop long pour la boucle
// best version ever
func repeatedString2(s: String, n: Int) -> Int {
    var occurrencesOfa = 0
    let nbOfCharactersInS = s.count
    let nbOfAInS = s.filter { $0 == "a" }.count
    let nbOfS = n / nbOfCharactersInS
    occurrencesOfa = nbOfAInS * nbOfS
    if n % nbOfCharactersInS > 0 {
        let substringOfS = s.prefix(n % nbOfCharactersInS)
        let nbOfAInSubstring = substringOfS.filter { $0 == "a" }.count
        occurrencesOfa += nbOfAInSubstring
    }
    return occurrencesOfa
}
//print(repeatedString2(s: "aba", n: 10))
//print(repeatedString2(s: "abacdca", n: 2))
//print(repeatedString2(s: "a", n: 100000000000000))


//https://www.hackerrank.com/challenges/jumping-on-the-clouds/problem?h_r=next-challenge&h_v=zen
func jumpingOnClouds(c: [Int]) -> Int {
    var res = 0
    var position = 0
    for i in 0...c.count - 2 {
        if i != position {
            continue
        }
        if i + 1 > c.count  || i + 2 > c.count {
            res += 0
        } else if i + 1 == c.count || i + 2 == c.count {
            res += 1
        } else {
            if c[i+2] == 1 { position += 1
            } else { position += 2 }
            res += 1
        }
    }
    return res
}

func jumpingOnCloudsFunctionnal(c: [Int]) -> Int {
    var position = 0
    let res = c.enumerated().reduce(0) { partialResult, current in
        if current.offset == position  {
            if current.offset + 1 > c.count  || current.offset + 2 > c.count {
                return partialResult
            }
            if current.offset + 1 == c.count || current.offset + 2 == c.count {
                return partialResult + 1
            }
            if c[current.offset + 2] == 1 {
                position += 1
                return partialResult + 1
            } else {
                position += 2
                return partialResult + 1
            }
        } else {
            return partialResult
        }
    }
    return res
}
//print(jumpingOnCloudsFunctionnal(c: [0, 0, 1, 0, 0, 1, 0]))
//print(jumpingOnCloudsFunctionnal(c: [0, 0, 0, 0, 1, 0]))
//print(jumpingOnCloudsFunctionnal(c: [0, 0, 0, 1, 0, 0]))
//print(jumpingOnCloudsFunctionnal(c: [0, 0, 1, 0, 0, 1, 0, 0]))
//print(jumpingOnCloudsFunctionnal(c: [0, 0, 1, 0, 0, 0, 0, 1, 0, 0]))


//https://www.hackerrank.com/challenges/equality-in-a-array/problem
func equalizeArray(arr: [Int]) -> Int {
    let occurences = arr.reduce(into: [:], { partialResult, next in
        return partialResult[next, default: 0] += 1
    })
    let maxOccurences = occurences.values.max()!
    let result = arr.count - maxOccurences
    
    // find the key and the value of the maximum occurences in occurences dictionary :
    var maxValue = 0
    var keyOfMaxValue = 0
    for occ in occurences {
        if occ.value > maxValue {
            maxValue = occ.value
            keyOfMaxValue = occ.key
        }
    }
    print(keyOfMaxValue)
    print(maxValue)
    
    return result
}
//print(equalizeArray(arr: [1, 2, 2, 3]))
//print(equalizeArray(arr: [3, 3, 2, 1, 3]))
//print(equalizeArray(arr: [24, 29, 70, 43, 12, 27, 29, 24, 41, 12, 41, 43, 24, 70, 24, 100, 41, 43, 43, 100, 29, 70, 100, 43, 41, 27, 70, 70, 59, 41, 24, 24, 29, 43, 24, 27, 70, 24, 27, 70, 24, 70, 27, 24, 43, 27, 100, 41, 12, 70, 43, 70, 62, 12, 59, 29, 62, 41, 100, 43, 43, 59, 59, 70, 12, 27, 43, 43, 27, 27, 27, 24, 43, 43, 62, 43, 70, 29]))

//https://www.hackerrank.com/challenges/the-hurdle-race/problem
func hurdleRace(k: Int, height: [Int]) -> Int {
    guard let max = height.max() else { return 0 }
    if max - k > 0 {
        return max - k
    } else { return 0 }
}
//print(hurdleRace(k: 1, height: [1, 2, 3, 3, 2]))
//print(hurdleRace(k: 7, height: [2, 5, 4, 5, 2]))
//print(hurdleRace(k: 4, height: [1, 6, 3, 5, 2]))
//https://www.hackerrank.com/challenges/designer-pdf-viewer/problem?h_r=next-challenge&h_v=zen
func designerPdfViewer(h: [Int], word: String) -> Int {
    let aScalars = "a".unicodeScalars
    print("a".unicodeScalars)
    let aCode = aScalars[aScalars.startIndex].value
    print(aCode)
    let letters: [Character] = (0..<26).map {
        i in Character(UnicodeScalar(aCode + i)!)
    }
    var dicoLetters = [Character: Int]()
    for i in 0...letters.count - 1 {
        dicoLetters[letters[i]] = h[i]
    }
    let wordTab = Array(word)
    var word = [Int]()
    for i in 0...wordTab.count - 1 {
        let letter = wordTab[i]
        word.append(dicoLetters[letter]!)
    }
    return word.max()! * word.count
    
}

//print(designerPdfViewer(h: [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5], word: "abc"))
//print(designerPdfViewer(h: [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7], word: "zaba"))

//https://www.hackerrank.com/challenges/funny-string/problem
func funnyString(s: String) -> String {
    let tabS = Array(s)
    let ascciTab = tabS.map({
        Int($0.asciiValue!)
    })
    let ascciTabReversed = Array(ascciTab.reversed())
    for i in 1...s.count - 1 {
        if abs(Int(ascciTab[i] - ascciTab[i - 1])) != abs(Int(ascciTabReversed[i] - ascciTabReversed[i - 1])) {
            return "Not Funny"
        }
    }
    return "Funny"
}
//print(funnyString(s: "lmnop"))
//print(funnyString(s: "holtm"))
//print(funnyString(s: "acxz"))
//print(funnyString(s: "bcxz"))
//print(funnyString(s: "ivvkxq"))
//print(funnyString(s: "ivvkx"))
//print(funnyString(s: "uvzxrumuztyqyvpnji")) // expected funny
//print(funnyString(s: "jkmsxzwrxzy")) // expected not funny
func funnyStringFunctional(s: String) -> String {
    let tabS = Array(s)
    let asciiTab = tabS.map({
        Int($0.asciiValue!)
    })
    print(asciiTab)
    var tabDifference = [Int]()
    asciiTab.reduce(0) { partialResult, next in
        let dif = abs(next - partialResult)
        tabDifference.append(dif)
        return next
    }
    tabDifference = Array(tabDifference.dropFirst())
    print(tabDifference)
    var differenceReversedTab = [Int]()
    asciiTab.reversed().reduce(0) { partialResult, next in
        let dif = abs(next - partialResult)
        differenceReversedTab.append(dif)
        return next
    }
    differenceReversedTab = Array(differenceReversedTab.dropFirst())
    print(differenceReversedTab)
    if tabDifference.elementsEqual(differenceReversedTab) {
        return "Funny"
    } else { return "Not Funny" }
}

//print(funnyStringFunctional(s: "lmnop"))
//print(funnyStringFunctional(s: "holtm"))

func funnyStringFunctional3(s: String) -> String {
    let tabS = Array(s)
    let asciiTab = tabS.map({
        Int($0.asciiValue!)
    })
    let tabDifference = asciiTab.reduce(into: [Int]()) { partialResult, next in
        if partialResult.isEmpty {
            partialResult.append(next)
        }
        let difference = (abs(next - partialResult.last!))
        partialResult.append(difference)
        partialResult.append(next)
    }
    var tab = [Int]()
    for i in 0...tabDifference.count - 1 {
        if i % 2 == 1 {
            tab.append(tabDifference[i])
        }
    }
    tab.removeFirst()
    
    let reversedDifferenceTab = asciiTab.reversed().reduce(into: [Int]()) { partialResult, next in
        if partialResult.isEmpty {
            partialResult.append(next)
        }
        let difference = (next - partialResult.last!).magnitude
        partialResult.append(Int(difference))
        partialResult.append(next)
    }
    var reverseTab = [Int]()
    for i in 0...reversedDifferenceTab.count - 1 {
        if i % 2 == 1 {
            reverseTab.append(reversedDifferenceTab[i])
        }
    }
    reverseTab.removeFirst()
    
    
    if tab.elementsEqual(reverseTab) {
        return "Funny"
    } else { return "Not Funny" }
}

//print(funnyStringFunctional3(s: "lmnop"))
//print(funnyStringFunctional3(s: "holtm"))

//https://www.hackerrank.com/challenges/beautiful-triplets/problem
func beautifulTriplets(d: Int, arr: [Int]) -> Int {
    var res = 0
    let orderedArr = arr.sorted(by:  {
        $0 > $1
    })
    var tabRes = [(k: Int, j: Int, i: Int)]()
    for k in 0...orderedArr.count - 1 {
        for j in 0...orderedArr.count - 1 {
            if k != j && orderedArr[k] > orderedArr[j] && orderedArr[k] - orderedArr[j] == d  {
                for i in 0...orderedArr.count - 1 {
                    if j != i && i != k && orderedArr[j] > orderedArr[i] && orderedArr[j] - orderedArr[i] == d {
                        res += 1
                        tabRes.append((orderedArr[k], orderedArr[j], orderedArr[i]))
                    }
                }
            }
        }
    }
    return res
}
//beautifulTriplets(d: 1, arr: [2, 2, 3, 4, 5])
//beautifulTriplets(d: 3, arr: [1, 2, 4, 5, 7, 8, 10])
//print(beautifulTriplets(d: 3, arr: [1, 6, 7, 7, 8, 10, 12, 13, 14, 19]))

//https://www.hackerrank.com/challenges/minimum-distances/problem?h_r=next-challenge&h_v=zen
func minimumDistances(a: [Int]) -> Int {
    var tabRes = [Int]()
    if a.count == 1 {
        return -1
    }
    for i in 0...a.count - 2 {
        for j in i + 1...a.count - 1 {
            if a[i] == a[j] {
                tabRes.append(abs(i - j))
            }
        }
    }
    return tabRes.min() ?? -1
}
//print(minimumDistances(a: [10]))
//print(minimumDistances(a: [3, 2, 1, 2, 3]))
//print(minimumDistances(a: [7, 1, 3, 4, 1, 7]))
func minimumDistances2(a: [Int]) -> Int {
    var tabRes = [Int]()
    _ = a.enumerated().map { m -> Int in
        var offsetDifference = 0
        a.enumerated().reduce(0) { result, next in
            print("m: \(m.element) next: \(next.element)")
            print("m: \(m.offset) next: \(next.offset)")
            if m.element == next.element && m.offset != next.offset {
                offsetDifference = abs(m.offset - next.offset)
                tabRes.append(offsetDifference)
            }
            print(tabRes)
            return 0
        }
        return offsetDifference
    }
    return tabRes.min() ?? -1
}
//print(minimumDistances2(a: [8, 6, 3, 4, 5, 8, 9, 12 ,4]))

//https://www.hackerrank.com/challenges/beautiful-days-at-the-movies/problem
func beautifulDays(i: Int, j: Int, k: Int) -> Int {
    guard 1 <= i && i <= j && j <= 2 * Int(pow(Double(6),Double(10))) else {
        print(2 * Int(pow(Double(6),Double(10))) )
        print("hello")
        return -1
    }
    
    guard 1 <= k && k <= 2 * Int(pow(Double(10),Double(9))) else {
        print(2 * Int(pow(Double(9),Double(10))))
        print("hi")
        return -1
    }
    
    var result = 0
    for index in i...j {
        let reversed = Int(String(String(index).reversed()))!
        let delta = abs(index - reversed)
        print("index : \(index) - reversed: \(reversed) = \(abs(index - reversed))")
        let rest = delta % k
        print("delta: \(delta) div modulo: \(k) = \(rest)")
        if rest == 0 {
            result += 1
            print("result: \(result)")
        }
        print(result)
        print("---")
    }
    return result
}
//print(beautifulDays(i: 20, j: 300, k: 6))
//print(beautifulDays(i: 13, j: 45, k: 3))
//print(beautifulDays(i: 2000000, j: 23047885, k: 2998))// not working too long !!!!
func beautifulDays2(i: Int, j: Int, k: Int) -> Int {
    guard 1 <= i && i <= j && j <= 2 * Int(pow(Double(10),Double(6))) else {
        print(2 * Int(pow(Double(10),Double(6))) )
        return -1
    }
    guard 1 <= k && k <= 2 * Int(pow(Double(10),Double(9))) else {
        print(2 * Int(pow(Double(10),Double(9))))
        return -1
    }
    var rem = 0
    var sum = 0
    var x = 0
    var count = 0
    for index in i...j {
        x = index
        while (x != 0) {
            rem = index % 10
            sum = (sum * 10) + rem
            x = x / 10
        }
        if abs(x - sum) % k == 0 {
            count += 1
            sum = 0
        }
    }
    return count
}
//print(beautifulDays(i: 13, j: 45, k: 3))
//print(beautifulDays(i: 20, j: 23, k: 6))
//print(beautifulDays2(i: 20, j: 300, k: 6))

//https://www.hackerrank.com/challenges/reduced-string/problem
func superReducedString(s: String) -> String {
    let arrayS = Array(s)
    print(arrayS)
    var pairFound = false
    let result = arrayS.reduce(into: [Character]()) { partialResult, next in
        print(partialResult)
        if pairFound == true {
            partialResult.removeLast()
            print("pairfound")
            pairFound = false
            print(String(partialResult))
            print("----")
        }
        if partialResult.isEmpty {
            print("empty")
            partialResult.append(next)
            print(String(partialResult))
            print("----")
        } else if partialResult.last! == next {
            print(String(partialResult))
            partialResult.removeLast()
            
            partialResult.append(next)
            pairFound = true
            print("== next")
            print(String(partialResult))
            print("----")
        } else {
            partialResult.append(next)
            print("not egal")
            print(String(partialResult))
            print("----")
        }
    }
    //print(String(result))
    return String(result)
}
//print(superReducedString(s: "abba"))

func superReducedString4(s: String) -> String {
    let arrayS = Array(s)
    print(arrayS)
    var resArray = [Character]()
    //resArray.append(arrayS[0])
    print(resArray)
    if arrayS.count == 1 {
        return String(arrayS[0])
    }
//    else if arrayS.count == 2 {
//        if arrayS.first == arrayS.last {
//            return ""
//        } else {
//            return String(arrayS)
//        }
//    }
    for i in 2...arrayS.count {
//        if resArray.isEmpty {
//            resArray.append(arrayS[i-1])
//            continue
//        }
print("arrayS[i]: \(arrayS[i]) arrayS[i-1]: \(arrayS[i-1]) arrayS[i-2]: \(arrayS[i-2])")
        if arrayS[i-1] != arrayS[i-2] {
            print("!=")
            if resArray.isEmpty {
                resArray.append(arrayS[i-2])
            }
            resArray.append(arrayS[i-1])
            
        } else {
            print("==")
            resArray.append(arrayS[i])
            
   
        }
//        if resArray.count < i + 1 {
//            print("break")
//            break
//        }
        print(resArray)
    }
  
    //print(arrayS)
    return String(resArray)
}
//print(superReducedString4(s: "aab"))

//https://www.hackerrank.com/challenges/find-the-median/problem
func findMedian(arr: [Int]) -> Int {
    let sortedArr = Array(arr.sorted())
    return (sortedArr[sortedArr.count / 2])
}
//print(findMedian(arr: [5, 3, 1, 2, 4]))

//https://www.hackerrank.com/challenges/countingsort2/problem
func countingSort3(arr: [Int]) -> [Int] {
    return arr.sorted()
}
//print(countingSort3(arr: [1, 1, 3, 2, 1]))
//print(countingSort3(arr: [19, 10, 12, 10, 24, 25, 22]))

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



//https://www.hackerrank.com/challenges/reduced-string/problem
func superReducedString3(s: String) -> String {
    let arrayS = Array(s)
    let resArray = arrayS.reduce(into: [Character]()) { partialResult, nextElement in
        if partialResult.isEmpty {
            partialResult.append(nextElement)
        } else if partialResult.last! != nextElement {
            partialResult.append(nextElement)
        } else {
            partialResult.removeLast()
        }
    }
    if resArray.isEmpty {
        return "Empty String"
    }
    return String(resArray)
}
//print(superReducedString3(s: "ab"))

func superReducedString2(s: String) -> String {
    let arrayS = Array(s)
    print(arrayS)
    var resArray = [Character]()
    resArray.append(arrayS[0])
    if arrayS.count == 1 {
        return String(arrayS[0])
    }
    for i in 1...arrayS.count - 1 {
        if !resArray.isEmpty {
            print("resArray.last: \(resArray.last!) arrayS[i]: \(arrayS[i]) ")
            if resArray.last! == arrayS[i] {
                resArray.removeLast()
                continue
            } else {
                resArray.append(arrayS[i])
            }
            print(resArray)
        } else {
            resArray.append(arrayS[i])
        }
    }
    if resArray.isEmpty {
        return "Empty String"
    }
    return String(resArray)
}
//print(superReducedString2(s: "baabb"))

//https://www.hackerrank.com/challenges/camelcase/problem?h_r=next-challenge&h_v=zen
func camelcase(s: String) -> Int {
    return s.filter({
        $0.isUppercase
    }).count + 1
}
//print(camelcase(s: "saveChangesInTheEditor"))

//https://www.hackerrank.com/challenges/strong-password/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
// Return the minimum number of characters to make the password strong
func minimumNumber(n: Int, password: String) -> Int {
    var res = 0
    let specialCharSet = CharacterSet.init(charactersIn: "!@#$%^&*()-+")
    let lowerCaseSet = CharacterSet.init(charactersIn: "abcdefghijklmnopqrstuvwxyz")
    let upperCaseSet = CharacterSet.init(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let digitCaseSet = CharacterSet.init(charactersIn: "0123456789")
    if (password.rangeOfCharacter(from: specialCharSet) == nil) { res += 1 }
    if (password.rangeOfCharacter(from: lowerCaseSet) == nil) { res += 1 }
    if (password.rangeOfCharacter(from: upperCaseSet) == nil) { res += 1 }
    if (password.rangeOfCharacter(from: digitCaseSet) == nil) { res += 1 }
    print("n: \(n)")
    print("res: \(res)")
    if res + n < 6 {
        return res + (6 - (res + n))
    } else { return res }
}
//print(minimumNumber(n: 4, password: "ipg")) // pb de soumission de code avec hackerrank

//https://www.hackerrank.com/challenges/find-digits/problem
func findDigits(n: Int) -> Int {
    let digitsTab = Array(String(n))
    print(digitsTab)
    var count = 0
    for i in 0...digitsTab.count - 1 {
        let digit = Int(String(digitsTab[i]))!
        if digit != 0 && n % digit == 0 {
            count += 1
        }
    }
    return count
}
//print(findDigits(n: 1012))

// https://www.hackerrank.com/challenges/happy-ladybugs/problem
func happyLadybugs(b: String) -> String {
    let ar = Array(b)
    // au moins chaque lettre a un doublon
    for a in ar {
        if a != "_" && ar.filter({$0 == a}).count == 1 {
            return "NO"
        }
    }
    // dans le cas ou pas d'underscore mais que des lettres :
    if ar.filter({$0 == "_"}).count == 0 {
        print("ar")
        for i in 1...ar.count - 1 {
            if i == 1 && ar[i] != ar[i-1] {
                return "NO"
            }
            if i == ar.count - 1 && ar[i - 1] != ar[i] {
                return "NO"
            }
            if i + 1 == ar.count && ar[i-1] != ar[i] {
                return "NO"
            }
            if ar[i-1] != ar[i] && ar[i+1] != ar[i] {
                return "NO"
            }
        }
    }
    // sinon tout est vrai
    return "YES"
}
//print(happyLadybugs(b: "X_Y__X"))

func happyLadybugs2(b: String) -> String {
    var ar = Array(b)
    // au moins chaque lettre a un doublon
    for a in ar {
        if a != "_" && ar.filter({$0 == a}).count == 1 {
            return "NO"
        }
    }
    // dans le cas ou pas d'underscore mais que des lettres :
    if ar.filter({$0 == "_"}).count == 0 {
        for i in 1...ar.count - 1 {
            if i == 1 && ar[i] != ar[i-1] { return "NO" }
            if i == ar.count - 1 && ar[i - 1] != ar[i] { return "NO" }
            if i + 1 == ar.count && ar[i-1] != ar[i] { return "NO" }
            if ar[i-1] != ar[i] && ar[i+1] != ar[i] { return "NO" }
        }
    }
    // facultatif : pour construire la chaine
    if ar == ["_"] { return "YES" }
    for i in 0...ar.count - 2 {
        if ar[i] == ar[i + 1]  { continue }
        let subAr = ar[i + 1...ar.count - 1]
        if let index = subAr.firstIndex(of: ar[i]) {
            if ar[i + 1] == "_" {
                ar[i + 1] = ar[i]
            } else if let underscoreIndex = subAr.firstIndex(of: "_") {
                let temp = ar[i + 1]
                ar[i + 1] = ar[underscoreIndex]
                ar[underscoreIndex] = temp
                ar[i + 1] = ar[i]
            }
            ar[index] = "_"
        }
        if ar.filter({$0 != "_"}).count == i + 1 { break }
    }
    return "YES"
}

// https://www.hackerrank.com/challenges/halloween-sale/problem
func howManyGames(p: Int, d: Int, m: Int, s: Int) -> Int {
    var price = p
    var number = 0
    var money = s
    while money >= m {
        money -= price
        price = max(price - d, m)
        number += 1
    }
    return number
}
//print(howManyGames(p: 20, d: 3, m: 6, s: 85))

//https://www.hackerrank.com/challenges/angry-professor/problem
func angryProfessor(k: Int, a: [Int]) -> String {
    if k <= a.filter({ $0 <= 0 }).count {
        return "NO"
    } else { return "YES" }
}
//print(angryProfessor(k: 2, a: [3, 2]))

//https://www.hackerrank.com/challenges/absolute-permutation/problem
func absolutePermutation(n: Int, k: Int) -> [Int] {
    var tab = [Int]()
    for i in 1...n { tab.append(i) }
    var res = tab.reduce(into: [Int](), { partialResult, next in
        partialResult.append(contentsOf: tab.filter {
            print("next: \(next)")
            print("$0: \($0)")
            return abs(next - $0) == k
        })
        
        print(partialResult)
    })
    if res.count < tab.count {res = [-1] }
    if res.filter({ $0 == 0}).count == tab.count {res = [-1] }
    return res
}
//print(absolutePermutation(n: 3, k: 2))

func absolutePermutation2(n: Int, k: Int) -> [Int] {
    var res = [Int]()
    var tab = [Int]()
    for i in 1...n { tab.append(i) }
    let reversedTab = Array(tab.reversed())
    for i in 1...reversedTab.count {
        for j in reversedTab {
            if abs(i - j) == k {
                res.append(j)
                break
            } else { continue }
        }
    }
    if res.count != tab.count { res = [-1] }
    if res.filter({ $0 == 0}).count == tab.count {res = [-1] }
    return res
}
//print(absolutePermutation2(n: 3, k: 2))

//https://www.hackerrank.com/challenges/fair-rations/problem
func fairRations(B: [Int]) -> String {
    let nbOddBroads = B.filter({
        $0 % 2 != 0
    }).count
    if nbOddBroads % 2 != 0 { return "NO" }
    if B.filter({ $0 % 2 == 0 }).count == B.count { return "0" }
    var oddTab = [Int]()
    for i in 0...B.count - 1 {
        if B[i] % 2 != 0 {
            oddTab.append(i)
        }
    }
    
    let result = oddTab.enumerated().reduce(into: [Int]()) { partialResult, next in
        if next.offset % 2 == 0 {
            partialResult.append(next.element)
        } else {
            if next.offset % 2 != 0 {
                let value = next.element - partialResult.last!
                partialResult.removeLast()
                partialResult.append(value)
            }
        }
    }.reduce(0, +) * 2
    
    if result > 0 { return String(result) } else { return "NO" }
    
}
//print(fairRations(B: [4, 5, 6, 8, 9, 12, 8, 7, 5, 14, 3, 9]))

//https://www.hackerrank.com/challenges/larrys-array/problem
// solution il faut juste compter le nombre d'inversions pour chaque nombre. si le nombre d'inversions est pair alors c'est triable
func larrysArray(A: [Int]) -> String {
    var nbInversions = 0
    if A.count == 1 { return "YES"}
    for i in 0...A.count - 2 {
        for j in i...A.count - 1 {
            print(A[i])
            print(A[j])
            print("--")
            if A[i] > A[j] {
                nbInversions += 1
            }
        }
        print("---")
    }
    print(nbInversions)
    if nbInversions % 2 == 0 { return "YES" } else { return "NO" }
    
    
}
//print(larrysArray(A: [3, 1, 2, 4]))

//https://www.hackerrank.com/challenges/circular-array-rotation/problem
func circularArrayRotation(a: [Int], k: Int, queries: [Int]) -> [Int] {
    var res = [Int]()
    var tab = a
    for _ in 1...k {
        let temp = tab.last!
        tab.removeLast()
        tab.insert(temp, at: 0)
    }
    for i in queries {
        res.append(tab[i])
    }
    return res
}
//print(circularArrayRotation(a: [3, 4, 5], k: 2, queries: [1, 2]))

func circularArrayRotation2(a: [Int], k: Int, queries: [Int]) -> [Int] {
    var modulo = k
    if k > a.count { modulo = k % a.count }
    var tabDecal = a.suffix(modulo)
    let tabDecal2 = a.prefix(abs(a.count - modulo))
    tabDecal.append(contentsOf: tabDecal2)
    let array = Array(tabDecal)
    var res = [Int]()
    for i in queries { res.append(array[i]) }
    return res
}
//print(circularArrayRotation2(a: [3, 1, 2,], k: 4, queries: [0, 1]))

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

//https://www.hackerrank.com/challenges/two-characters/problem
// solution : https://www.hackerrank.com/challenges/two-characters/forum
func alternateNotWorking(s: String) -> Int {
    let arrayS = Array(s)
    var res = arrayS
    
    let occurences = arrayS.reduce(into: [:], { partialResult, next in
        partialResult[next, default: 0] += 1
    })
    print(occurences)
    if s.isEmpty || s.count == 1 {
        return 0
    }
    for i in 1...arrayS.count - 1 {
        if res.isEmpty || res.count == 1 {
            return 0
        }
        if arrayS[i] == arrayS[i - 1] {
            res = res.filter { $0 != arrayS[i-1] }
        }
        
        print(res)
    }
    return res.count
}
//print(alternate(s: "beabeefeab"))
//print(alternateNotWorking(s: "abaacdabd"))
//print(alternate(s: "asdcbsdcagfsdbgdfanfghbsfdab"))

func alternate(s: String) -> Int {
    var result = 0
    if s.count < 2 {
        return result
    } else if s.count == 2 && s.first == s.last {
        return result
    }
    let tabS = Array(s)
    let setS = Array(Set(tabS).sorted())
    
    //let tabS2 = s.map(String.init)
    //let tabS3 = s.map { String($0) }
    let numberLetters = Set(tabS).count
    var tabA = Array(repeating: Array(repeating: "", count: numberLetters), count: numberLetters)
    var tabCount = Array(repeating: Array(repeating: 0, count: numberLetters), count: numberLetters)
    var count = 1
    for char in tabS {
        count += 1
        print(Set(tabS).sorted().enumerated())
        for letter in Set(tabS).sorted().enumerated() {
            if letter.element == char {
                for i in 0...numberLetters - 1 {
                    for j in 0...numberLetters - 1 {
                        let character = String(char)
                        print(character)
                        if i == j {
                            tabA[i][j] = "-1"
                            continue
                        }
                        if i == letter.offset || j == letter.offset {
                            if character != tabA[i][j] && tabA[i][j] != "-1" {
                                tabA[i][j] = character
                                tabCount[i][j] += 1
                                
                            } else {
                                tabCount[i][j] = 0
                                tabA[i][j] = "-1"
                            }
                        }
                    }
                }
                //                for i in tabA {
                //                    print(i)
                //                }
                //print("-------- \(count)")
            }
        }
    }
    
    var tabTuples = [(name: String, value: Int)]()
    for i in 0...numberLetters - 1 {
        for j in 0...numberLetters - 1 {
            if tabA[i][j] != "-1" && tabA[i][j] == tabA[j][i] {
                tabTuples.append((name: String(setS[i]), value: tabCount[i][j]))
            }
        }
    }
    let maxValue = tabTuples.reduce(0, {
        max($0, $1.value)
    })
    let tabResults = tabTuples.filter {
        $0.value == maxValue
    }.map { $0.name}
    
    
    result = tabS.filter({
        String($0) == tabResults.first || String($0) == tabResults.last
    }).count
    
    return result
}
//print(alternate(s: "abcabfacb"))
//print(alternate(s: "beabeefeab"))
//print(alternate(s: "npvpuv"))
//print(alternate(s: "asvkugfiugsalddlasguifgukvsa"))
//print(alternate(s: "asdcbsdcagfsdbgdfanfghbsfdab"))

//https://www.hackerrank.com/challenges/cut-the-sticks/problem
func cutTheSticks(arr: [Int]) -> [Int] {
    var sticksTab = arr
    var res = [arr.count]
    while !sticksTab.isEmpty {
        sticksTab = sticksTab.map {
            $0 - sticksTab.min()!
        }.filter {
            $0 > 0
        }
        res.append(sticksTab.count)
    }
    res.removeLast()
    return res
}
//print(cutTheSticks(arr: [5, 4, 4, 2, 2, 8]))
//print(cutTheSticks(arr: [1, 2, 3, 4, 3, 3, 2, 1]))
//print(cutTheSticks(arr: [1, 13, 3, 8, 14, 9, 4, 4]))

//https://www.hackerrank.com/challenges/morgan-and-a-string/problem
func morganAndString(a: String, b: String) -> String {
    var arrA = Array(a.appending("z"))
    var arrB = Array(b.appending("z"))
    var res = [String]()
    for _ in 0...(a.count + b.count - 1) {
        if String(arrA) < String(arrB) {
            res.append(String(arrA[0]))
            arrA.removeFirst()
        } else {
            res.append(String(arrB[0]))
            arrB.removeFirst()
        }
    }
    return res.joined()
}
//print(morganAndString(a: "JACK", b: "DANIEL"))

//https://www.hackerrank.com/challenges/gem-stones/problem
func gemstones(arr: [String]) -> Int {
    var res = 0
    let minChar = arr.reduce(100) {
        min($0, $1.count)
    }
    let minString = arr.filter {
        $0.count == minChar
    }.first
    let array = Array(Set(Array(String(minString!))))
    for letter in array {
        var count = 0
        for string in arr {
            if string.contains(letter) {
                count += 1
                continue
            }
        }
        if count == arr.count {
            print(letter)
            res += 1
            print("res \(res)")
        }
    }
    return res
}

func gemstonesOptimized(arr: [String]) -> Int {
    let tabSet = arr.map { Set($0) }
    var result = tabSet.first!
    for i in 1...tabSet.count - 1 {
        result = result.intersection(tabSet[i])
    }
    return result.count
}
//print(gemstonesOptimized(arr: ["acdde", "baccd", "eeabg"]))

func gemstonesFuncOptimized(arr: [String]) -> Int {
    let tabSet = arr.map { Set($0) }
    return tabSet.reduce(tabSet.first!) { $0.intersection($1) }.count
}
//print(gemstonesFuncOptimized(arr: ["abcdde", "baccd", "eeabg"]))

// https://www.hackerrank.com/challenges/weighted-uniform-string/problem
func weightedUniformStrings(s: String, queries: [Int]) -> [String] {
    var result = [String]()
    let first: Character = "a"
    let last: Character = "z"
    var lettersValue = [String: Int]()
    
    for ascii in first.asciiValue!...last.asciiValue! {
        let letter = String(describing: UnicodeScalar(ascii))
        lettersValue[letter] = Int(ascii - 96)
    }
    var weightStrings = [Int]()
    var previous = "1"
    for l in s {
        let letter = String(l)
        if letter != previous {
            weightStrings.append(lettersValue[letter]!)
        } else {
            weightStrings.append(weightStrings.last! + lettersValue[letter]!)
        }
        previous = letter
    }
    let setSums = Set(weightStrings)
    for q in queries {
        if setSums.contains(q) {
            result.append("Yes")
        } else { result.append("No") }
    }
    print(weightStrings)
    print(setSums)
    print(queries)
    return result
}
//print(weightedUniformStrings(s: "abccddde", queries: [1, 3, 12, 5, 9, 10]))
//print(weightedUniformStrings(s: "aaabbbbcccddd", queries: [5, 9, 7, 8, 12, 5]))

// https://www.hackerrank.com/challenges/alternating-characters/problem
func alternatingCharactersNotWorking(s: String) -> Int {
    var nbDeleted = 0
    _ = s.reduce(into: [Character]()) { partialResult, next in
        if partialResult.isEmpty {
            partialResult.append(next)
            print(partialResult)
        } else if partialResult.last! != next {
            partialResult.append(next)
            print(partialResult)
        } else {
            partialResult.removeLast()
            partialResult.append(next)
            nbDeleted += 1
            print(partialResult)
        }
    }
    return nbDeleted
}// not working time out (ne pas remplir le tableau)
//print(alternatingCharactersNotWorking(s: "AAABBB"))

func alternatingCharacters(s: String) -> Int {
    let tab = Array(s)
    print(tab)
    var nbDeleted = 0
    for i in 1..<tab.count {
        if tab[i - 1] == tab[i] {
            nbDeleted += 1
        }
    }
    return nbDeleted
}
//print(alternatingCharacters(s: "AAABBB"))

// https://www.hackerrank.com/challenges/closest-numbers/problem
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
print(closestNumbers2(arr: [5,2,3,4,1]))

