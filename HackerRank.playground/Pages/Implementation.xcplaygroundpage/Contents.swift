
import Foundation

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

//https://www.hackerrank.com/challenges/breaking-best-and-worst-records/problem
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

// https://www.hackerrank.com/challenges/utopian-tree/problem
func utopianTree(n: Int) -> Int {
    var res = 1
    if n == 0 { return 1 }
    if n == 1 { return 2 }
    for _ in 1...n/2 {
        res = (res * 2) + 1
        print(res)
    }
    if n % 2 == 1 { res *= 2 }
    return res
}
//print(utopianTree(n: 9))

//https://www.hackerrank.com/challenges/angry-professor/problem
func angryProfessor(k: Int, a: [Int]) -> String {
    if k <= a.filter({ $0 <= 0 }).count {
        return "NO"
    } else { return "YES" }
}
//print(angryProfessor(k: 2, a: [3, 2]))

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

//https://www.hackerrank.com/challenges/sherlock-and-squares/problem
func squares(a: Int, b: Int) -> Int {
    var numOfSquares = 0
    var x = 1
    while x * x < a {
        x += 1
    }
    while x * x <= b {
        numOfSquares += 1
        x += 1
    }
    return numOfSquares
}
//print(squares(a: 24, b: 49))

//https://www.hackerrank.com/challenges/organizing-containers-of-balls/problem
func organizingContainers(container: [[Int]]) -> String {
    var sumOfBalls = [Int]()
    var sumOfBallsType = [Int]()
    for c in 0...container.count - 1 {
        sumOfBalls.append(container[c].reduce(0, +))
        var sumOfType = 0
        for t in 0...container[c].count - 1 {
            sumOfType += container[t][c]
        }
        sumOfBallsType.append(sumOfType)
    }
    print(sumOfBalls)
    print(sumOfBallsType)
    
    if sumOfBalls.sorted() != sumOfBallsType.sorted() {
        return "Impossible"
    }
    return "Possible"
}
print(organizingContainers(container: [[999336263, 998799923],  [998799923, 999763019]]))

print(organizingContainers(container: [[1, 1], [1, 1]]))
print(organizingContainers(container: [[0, 2], [1, 1]]))

print(organizingContainers(container: [[5, 2], [2, 6]]))
//
//print(organizingContainers(container: [[1, 3], [4, 3]]))

