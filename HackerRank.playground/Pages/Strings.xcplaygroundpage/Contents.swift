//: [Previous](@previous)

import Foundation

//https://www.hackerrank.com/challenges/mars-exploration/problem
func marsExploration(s: String) -> Int {
    let expectedWord = "SOS"
    var nbRadioactiveLetters = 0
    for i in 0...s.count - 1 {
        let j = i + 1
        if j % expectedWord.count == 0 || j % expectedWord.count == 1 {
            if Array(s)[i] != "S" {
                nbRadioactiveLetters += 1
            }
        } else if j % expectedWord.count == 2 {
            if Array(s)[i] != "O" {
                nbRadioactiveLetters += 1
            }
        }
    }
    return nbRadioactiveLetters
}
//print(marsExploration(s: "SOSTOT"))

//https://www.hackerrank.com/challenges/caesar-cipher-1/problem
func caesarCipher(s: String, k: Int) -> String {
    var res = ""
    for i in s.unicodeScalars {
        var asciiValue = Int(i.value) + (k % 26)
        switch i.value {
        case 65..<91:
            if asciiValue > 90 {
                asciiValue = 64 + asciiValue - 90
            }
            //print(asciiValue)
            res += String(Character(UnicodeScalar(asciiValue)!))
        case 97..<123:
            if asciiValue > 122 {
                asciiValue = 95 + asciiValue - 121
            }
            //print(asciiValue)
            res += String(Character(UnicodeScalar(asciiValue)!))
        default:
            res += String(Character(UnicodeScalar(Int(i.value))!))
        }
    }
    print(s.unicodeScalars)
    return res
}
//print(caesarCipher(s: "There's-a-starman-waiting-in-the-sky", k: 3))
//print(caesarCipher(s: "www.abc.xy", k: 87))

func caesarCipher2(s: String, k: Int) -> String {
    var res = ""
    let firstLowerCharAsciiValue = Int(Character("a").asciiValue!)
    let lastLowerCharAsciiValue = Int(Character("z").asciiValue!)
    let firstUpperCharAsciiValue = Int(Character("A").asciiValue!)
    let lastUpperCharAsciiValue = Int(Character("Z").asciiValue!)
    for i in s.unicodeScalars {
        var asciiValue = Int(i.value)
        switch Int(i.value) {
        case firstUpperCharAsciiValue..<lastUpperCharAsciiValue + 1:
            if asciiValue > lastUpperCharAsciiValue {
                asciiValue = firstUpperCharAsciiValue + asciiValue - 91
            }
            res += String(Character(UnicodeScalar(asciiValue)!))
        case firstLowerCharAsciiValue..<lastLowerCharAsciiValue + 1:
            if asciiValue > lastLowerCharAsciiValue {
                asciiValue = firstLowerCharAsciiValue + asciiValue - 123
            }
            res += String(Character(UnicodeScalar(asciiValue)!))
        default:
            res += String(Character(UnicodeScalar(Int(i.value))!))
        }
    }
    print(s)
    return res
}
//print(caesarCipher(s: "There's-a-starman-waiting-in-the-sky", k: 3))
//print(caesarCipher2(s: "www.Abc.xy", k: 87))

func caesarCipher3(s: String, k: Int) -> String {
    var res = ""
    var refChar: Character
    for i in s.unicodeScalars {
        if i.isASCII {
            refChar = Character(i).isUppercase == true ? "A" : "a"
            let letter = String(UnicodeScalar(i))
            if (letter >= "A" && letter <= "Z") ||
                (letter >= "a" && letter <= "z") {
                let asciiValue = Int(refChar.asciiValue!) + ((Int(Character(UnicodeScalar(i)).asciiValue!) - Int(refChar.asciiValue!) + k) % 26)
                res += String(UnicodeScalar(asciiValue)!)
            } else {
                print("non")
                res += String(UnicodeScalar(i))
            }
        }
    }
    return res
}
//print(caesarCipher(s: "There's-a-starman-waiting-in-the-sky", k: 3))
//print(caesarCipher3(s: "www.Z.,=dfgDabCDfc.xyZZ", k: 3))

//https://www.hackerrank.com/challenges/pangrams/problem
func pangrams(s: String) -> String {
    var res = "not pangram"
    let string = String(Set(s.lowercased()))
    var alphabetTab = [UInt8]()
    let start = CFAbsoluteTimeGetCurrent()
    for i in Character("a").asciiValue!...Character("z").asciiValue! { alphabetTab.append(i) }
    alphabetTab = Array(Set(alphabetTab))
    for c in string.unicodeScalars {
        let asciiValue = Character(c).asciiValue!
        if alphabetTab.contains(asciiValue) {
            alphabetTab = alphabetTab.filter { $0 != asciiValue }
        }
        if alphabetTab.isEmpty { res = "pangram" }
    }
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    return res
    
}
//print(pangrams(s: "The quick brown fox jumps over the lazy dog"))

func pangrams2(s: String) -> String { // meilleur runtime !!!
    var res = "not pangram"
    var alphabetTab = [UInt8]()
    let start = CFAbsoluteTimeGetCurrent()
    for i in Character("a").asciiValue!...Character("z").asciiValue! { alphabetTab.append(i) }
    alphabetTab = Array(Set(alphabetTab))
    for c in s.lowercased().unicodeScalars {
        print(Character(c).asciiValue!)
        let asciiValue = Character(c).asciiValue!
        if alphabetTab.contains(asciiValue) {
            alphabetTab = alphabetTab.filter { $0 != asciiValue }
        }
        print(alphabetTab)
        if alphabetTab.isEmpty { res = "pangram" }
        print(alphabetTab)
    }
    let diff = CFAbsoluteTimeGetCurrent() - start
    print(diff)
    return res
}

//print(pangrams2(s: "We promptly judged antique ivory buckles for the next prize"))

//https://www.hackerrank.com/challenges/separate-the-numbers/problem
func separateNumbers(s: String) -> Void {
    var finished = false
    var nbChar = 1
    var resRef = ""
    var res = "NO"
    if s.count == 1 {
        print("NO")
        return
    }
    while finished == false {
        
        var refString = String(s.prefix(nbChar))
        resRef = refString
        if refString.count > s.count / 2 {
            res = "NO"
            resRef = ""
            finished = true
            break
        }
        var expectedValue = String(Int(refString)! + 1)
        var counter = refString.count
        for _ in 0...s.count - 1 {
            let substring = s.suffix(s.count - counter)
            if substring.count == 0 {
                finished = true
                break
            } else if s.count - counter < 0 {
                finished = true
                res = "NO"
                resRef = ""
                break
            }
            
            if substring.starts(with: expectedValue) {
                res = "YES"
                counter += expectedValue.count
                refString = expectedValue
                expectedValue = String(Int(refString)! + 1)
            } else {
                res = "NO"
                resRef = ""
                nbChar += 1
                break
            }
        }
        if res == "NO" { resRef = "" }
    }
    print("\(res) \(resRef)")
}
//separateNumbers(s: "54555657585960")

//https://www.hackerrank.com/challenges/beautiful-binary-string/problem
func beautifulBinaryString(b: String) -> Int {
    var substring = b
    var count = 0
    while substring.count >= 3  {
        if substring.hasPrefix("010") {
            count += 1
            substring = String(substring.suffix(substring.count - 3))
            if substring.isEmpty { return count }
            var subCount = 0
            while substring.count >= 2 {
                if substring.hasPrefix("10") {
                    substring = String(substring.suffix(substring.count - 2))
                    subCount += 1
                } else { break }
            }
            if subCount < 2 { subCount = 0 } else { subCount /= 2 }
            count += subCount
        } else {
            substring.removeFirst()
        }
    }
    return count
}
//print(beautifulBinaryString(b: "0100101010100010110100100110110100011100111110101001011001110111110000101011011111011001111100011101"))
//print(beautifulBinaryString(b: "0101010"))

func beautifulBinaryString2(b: String) -> Int { // OK
    let newB = b.replacingOccurrences(of: "010", with: "")
    return (b.count - newB.count) / 3
}
//print(beautifulBinaryString2(b: "0101010101010"))

//https://www.hackerrank.com/challenges/palindrome-index/problem
func palindromeIndex(s: String) -> Int {
    var string = s
    var i = 0
    var found = false
    while i <= (s.count - 1) / 2 {
        let currentFirst = string.first!
        let currentLast = string.last!
        if found == true && string.count <= 1 { return -1 }
        if currentFirst == currentLast {
            print(string)
            string.removeFirst()
            if string.count >= 1 {string.removeLast() }
            i += 1
        } else {
            found = true
            let next = string.index(string.startIndex, offsetBy: 1)
            print("next \(next)")
            if string[next] == currentFirst {
                print("dans if")
                string.removeLast()
                print(string)
                return s.count - 1 - i
            } else {
                print("dans else")
                string.removeFirst()
                print(string)
                return i
            }
        }
    }
    return -1
}
//print(palindromeIndex(s: "ccbbbac"))

//https://www.hackerrank.com/challenges/game-of-thrones/problem
func gameOfThrones(s: String) -> String {
    var nbOddsOccurences = 0
    let occurencesDico = s.reduce(into: [:]) { partialResult, next in
        partialResult[next, default: 0] += 1
    }
    for value in occurencesDico.values {
        if value % 2 != 0 {
            nbOddsOccurences += 1
        }
    }
    if s.count % 2 == 0 {
        if nbOddsOccurences == 0 { return "YES" }
    } else {
        if nbOddsOccurences == 1 { return "YES" }
    }
    return "NO"
}
//print(gameOfThrones(s: "abcde"))

// https://www.hackerrank.com/challenges/anagram/problem
func anagram(s: String) -> Int {
    var res = -1
    if s.count % 2 != 0 { return -1 }
    res = 0
    let substringA = s.prefix(s.count / 2)
    let substringB = s.suffix(s.count / 2)
    let aDico = substringA.reduce(into: [:]) { partialResult, next in
        partialResult[next, default: 0] += 1
    }
    let bDico = substringB.reduce(into: [:]) { partialResult, next in
        partialResult[next, default: 0] += 1
    }
    for b in bDico {
        if b.value >= aDico[b.key, default: 0] {
            res += b.value - aDico[b.key, default: 0]
        }
    }
    return res
}
//print(anagram(s: "fdhlvosfpafhalll"))

// https://www.hackerrank.com/challenges/making-anagrams/problem
func makingAnagrams(s1: String, s2: String) -> Int {
    var minString = String(min(s1, s2).sorted())
    var maxString = String(max(s1, s2).sorted())
    for c in minString {
        if maxString.contains(c) {
            minString.removeFirst()
            maxString.remove(at: maxString.firstIndex(of: c)!)
        }
    }
    return minString.count + maxString.count
}
//print(makingAnagrams(s1: "absdjkvuahdakejfnfauhdsaavasdlkj", s2: "djfladfhiawasdkjvalskufhafablsdkashlahdfa"))

//https://www.hackerrank.com/challenges/two-strings/problem
func twoStrings(s1: String, s2: String) -> String {
    let sorted1 = String(Set(s1).sorted())
    let sorted2 = String(Set(s2).sorted())
    let minString = String(min(sorted1, sorted2))
    let maxString = String(max(sorted1, sorted2))
    for char in minString {
        if maxString.contains(char) {
            return "YES"
        }
    }
    return "NO"
}
//print(twoStrings(s1: "helloppp", s2: "world"))

// https://www.hackerrank.com/challenges/sherlock-and-valid-string/problem
func isValid(s: String) -> String {
    let occurences = s.reduce(into: [:]) { partialResult, next in
        partialResult[next, default: 0] += 1
    }.values
    let occurenceMax = occurences.max()!
    let occurenceMin = occurences.min()!
    if s.count == 1 { return "YES" }
    if occurenceMax == occurenceMin ||
        occurences.filter({$0 == 1}).count == 1 && occurences.filter({$0 == occurenceMax}).count == occurences.count - 1 { return "YES" }
    if occurences.filter({ $0 != occurenceMin && $0 - 1 > occurenceMin }).count > 0 || occurences.filter({ $0 == 1 }).count > 1 {return "NO" }
    return "YES"
}
//print(isValid(s:"aaaabbcc"))
//print(isValid(s:"ibfdgaeadiaefgbhbdghhhbgdfgeiccbiehhfcggchgghadhdhagfbahhddgghbdehidbibaeaagaeeigffcebfbaieggabcfbiiedcabfihchdfabifahcbhagccbdfifhghcadfiadeeaheeddddiecaicbgigccageicehfdhdgafaddhffadigfhhcaedcedecafeacbdacgfgfeeibgaiffdehigebhhehiaahfidibccdcdagifgaihacihadecgifihbebffebdfbchbgigeccahgihbcbcaggebaaafgfedbfgagfediddghdgbgehhhifhgcedechahidcbchebheihaadbbbiaiccededchdagfhccfdefigfibifabeiaccghcegfbcghaefifbachebaacbhbfgfddeceababbacgffbagidebeadfihaefefegbghgddbbgddeehgfbhafbccidebgehifafgbghafacgfdccgifdcbbbidfifhdaibgigebigaedeaaiadegfefbhacgddhchgcbgcaeaieiegiffchbgbebgbehbbfcebciiagacaiechdigbgbghefcahgbhfibhedaeeiffebdiabcifgccdefabccdghehfibfiifdaicfedagahhdcbhbicdgibgcedieihcichadgchgbdcdagaihebbabhibcihicadgadfcihdheefbhffiageddhgahaidfdhhdbgciiaciegchiiebfbcbhaeagccfhbfhaddagnfieihghfbaggiffbbfbecgaiiidccdceadbbdfgigibgcgchafccdchgifdeieicbaididhfcfdedbhaadedfageigfdehgcdaecaebebebfcieaecfagfdieaefdiedbcadchabhebgehiidfcgahcdhcdhgchhiiheffiifeegcfdgbdeffhgeghdfhbfbifgidcafbfcd"))

// https://www.hackerrank.com/challenges/richie-rich/problem
func highestValuePalindrome(s: String, n: Int, k: Int) -> String {
    let halfString = s.count / 2
    var nbChance = k
    var firstString = s.prefix(halfString)
    var lastString = String(s.suffix(halfString).reversed())
    var nbRequired = 0
    var maxDico = [Int: String]()
    if k >= s.count { return String(s.map { _ in "9" }) }
    
    print(firstString)
    print(lastString)
    print("-----")
    // compter le nombre requis pour former un palyndrome
    // et mettre les index des chiffres à changer dans un tableau
    for i in 0...firstString.count - 1 {
        let index = firstString.index(firstString.startIndex, offsetBy: i)
        if firstString[index] != lastString[index] {
            nbRequired += 1
            nbChance -= 1
            let maxi = max(firstString[index], lastString[index])
            if firstString[index] == maxi {
                lastString.remove(at: index)
                lastString.insert(maxi, at: index)
            } else {
                firstString.remove(at: index)
                firstString.insert(maxi, at: index)
            }
            maxDico[i] = String(maxi)
        }
    }
    print(firstString)
    print(lastString)
    print("-----")
    print(firstString.appending(String(lastString.reversed())))
    print(maxDico)
    print("-----")
    if nbRequired > k { return "-1" }
    for i in 0...firstString.count - 1 where nbChance > 0 {
        let index = firstString.index(firstString.startIndex, offsetBy: i)
        if firstString[index] <= firstString[firstString.index(after: index)] {
            if maxDico.keys.contains(i) {
                if nbChance >= 1 {
                    firstString.remove(at: index)
                    firstString.insert("9", at: index)
                    lastString.remove(at: index)
                    lastString.insert("9", at: index)
                }
                nbChance -= 1
            } else {
                if nbChance >= 2 {
                    firstString.remove(at: index)
                    firstString.insert("9", at: index)
                    lastString.remove(at: index)
                    lastString.insert("9", at: index)
                    nbChance -= 2
                }
            }
        }
    }
    
    if s.count % 2 != 0 {
        if nbChance > 0 {
            firstString.append("9")
        } else {
            let halfIndex = s.index(s.startIndex, offsetBy: (s.count / 2))
            firstString.append(s[halfIndex])
        }
    }
    return firstString.appending(String(lastString.reversed()))
}
//print(highestValuePalindrome(s: "123551", n: 6, k: 4))

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
//print(missingNumbers(arr: [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
//                     , brr: [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]
//))

// https://www.hackerrank.com/challenges/equal/problem
func equal(arr: [Int]) -> Int {
    print(arr)
    var count = 0
    var tabRes = arr
    print(tabRes)
    var min = tabRes.min()!
    var max = tabRes.max()!
    var diff = 0
    while max != min {
        if max - min < 2 { diff =  1 }
        else if max - min < 5 { diff =  2 }
        else { diff = 5 }
        let maxIndex = tabRes.firstIndex(of: max)
        
        for i in 0...tabRes.count - 1 {
            if i != maxIndex { tabRes[i] += diff }
        }
        print(tabRes)
        count += 1
        min = tabRes.min()!
        max = tabRes.max()!
    }
    return count
}
//print(equal(arr: [5, 10, 14, 22]))
//print(equal(arr: [2, 3, 7, 10]))
//print(equal(arr: [10, 7, 12]))
//print(equal(arr: [10, 7, 12]))
//print(equal(arr: [11, 7, 12, 3]))
//print(equal(arr: [512, 125, 928, 381, 890, 90, 512, 789, 469, 473, 908, 990, 195, 763, 102, 643, 458, 366, 684, 857, 126, 534, 974, 875, 459, 892, 686, 373, 127, 297, 576, 991, 774, 856, 372, 664, 946, 237, 806, 767, 62, 714, 758, 258, 477, 860, 253, 287, 579, 289, 496]))
//print(equal(arr: [520, 862, 10, 956, 498, 956, 991, 542, 523, 664, 378, 194, 76 ,90 ,753, 868, 837, 830, 932, 814, 616, 78, 103, 882, 452, 397, 899, 488, 149, 108, 723, 22, 323 ,733 ,330 ,821 ,41 ,322 ,715, 917, 986, 93 ,111, 63 ,535, 864 ,931 ,372, 47 ,215 ,539 ,15 ,294, 642, 897, 98, 391, 796, 939, 540, 257, 662, 562, 580, 747, 893, 401, 789, 215, 468, 58 ,553 ,561 ,169 ,616, 448, 385 ,900 ,173, 432, 115, 712]))
//print(equal(arr: [134, 415, 784, 202, 34, 584, 543, 119, 701, 7, 700, 959, 956, 975, 484, 426, 738, 508, 201, 527, 816, 136, 668, 624, 535, 108, 1 ,965, 857, 152, 478, 344, 567, 262, 546, 953, 199 ,90, 72, 900, 449, 773, 211, 758, 100, 696, 536, 838, 204, 738, 717, 21, 874, 385, 997, 761, 845, 998, 78, 703, 502, 557, 47, 421, 819, 945, 375, 370, 35, 799, 622, 837, 924, 834, 595, 24 ,882, 483, 862, 438, 221, 931, 811, 448, 317, 809, 561, 162, 159, 640, 217, 662, 197, 616, 435, 368, 562, 162, 739, 949, 962, 713, 786, 238, 899, 733, 263, 781, 217, 477, 220, 790, 409, 383, 590, 726, 192, 152, 240, 352, 792, 458, 366, 341, 74 ,801, 709, 988, 964, 800, 938, 278, 514, 76 ,516, 413, 810 ,131 ,547, 379, 609, 119, 169, 370, 502, 112, 448, 695, 264, 688, 399, 408, 498, 765, 749, 925, 918, 458, 913, 234, 611]))
func equal2(arr: [Int]) -> Int {
    var tabRes = arr
    let min = tabRes.min()!
    var count = 0
    for i in 0...tabRes.count - 1 {
        while tabRes[i] != min {
            print(tabRes[i])
            let diff = tabRes[i] - min
            //if diff == min { break }
            if diff >= 5 {
                //print("tabRes[i] - 5")
                tabRes[i] = tabRes[i] - 5
                print(tabRes[i])
            } else if diff >= 2 && diff < 5 {
                //print("tabRes[i] - 2")
                tabRes[i] = tabRes[i] - 2
                print(tabRes[i])
            } else  {
                tabRes[i] = tabRes[i] - 1
                print(tabRes[i])
                //print("tabRes[i] - 1")
            }
            count += 1
        }
    }
    return count
}
//print(equal2(arr: [32, 125, 120, 78]))
//print(equal2(arr: [5, 10, 14, 22]))
//print(equal2(arr: [10, 7, 12, 20]))
//print(equal2(arr: [2, 2, 3, 7]))
//print(equal2(arr: [11, 7, 12, 3]))
//print(equal2(arr: [520, 862, 10, 956, 498, 956, 991, 542, 523, 664, 378, 194, 76 ,90 ,753, 868, 837, 830, 932, 814, 616, 78, 103, 882, 452, 397, 899, 488, 149, 108, 723, 22, 323 ,733 ,330 ,821 ,41 ,322 ,715, 917, 986, 93 ,111, 63 ,535, 864 ,931 ,372, 47 ,215 ,539 ,15 ,294, 642, 897, 98, 391, 796, 939, 540, 257, 662, 562, 580, 747, 893, 401, 789, 215, 468, 58 ,553 ,561 ,169 ,616, 448, 385 ,900 ,173, 432, 115, 712]))
//print(equal2(arr: [134, 415, 784, 202, 34, 584, 543, 119, 701, 7, 700, 959, 956, 975, 484, 426, 738, 508, 201, 527, 816, 136, 668, 624, 535, 108, 1 ,965, 857, 152, 478, 344, 567, 262, 546, 953, 199 ,90, 72, 900, 449, 773, 211, 758, 100, 696, 536, 838, 204, 738, 717, 21, 874, 385, 997, 761, 845, 998, 78, 703, 502, 557, 47, 421, 819, 945, 375, 370, 35, 799, 622, 837, 924, 834, 595, 24 ,882, 483, 862, 438, 221, 931, 811, 448, 317, 809, 561, 162, 159, 640, 217, 662, 197, 616, 435, 368, 562, 162, 739, 949, 962, 713, 786, 238, 899, 733, 263, 781, 217, 477, 220, 790, 409, 383, 590, 726, 192, 152, 240, 352, 792, 458, 366, 341, 74 ,801, 709, 988, 964, 800, 938, 278, 514, 76 ,516, 413, 810 ,131 ,547, 379, 609, 119, 169, 370, 502, 112, 448, 695, 264, 688, 399, 408, 498, 765, 749, 925, 918, 458, 913, 234, 611]))

func equalOptimized(arr: [Int]) -> Int {
    let tabRes = arr
    let min = tabRes.min()!
    var count = 0
    for i in 0...tabRes.count - 1 {
        var diff = tabRes[i] - min
        var div = 0
        var modulo = 0
        if diff >= 5 {
            div = diff / 5
            modulo = diff % 5
            
            if modulo == 0 {
                count += div
                continue
            }
            count += div
            diff = modulo
        }
        if diff >= 2 && diff <= 5 {
            div = diff / 2
            modulo = diff % 2
            if modulo == 0 {
                count += div
                continue
            }
            count += div
            diff = modulo
        }
        if diff == 1 {
            count += 1
            continue
        }
    }
    return count
}
//print(equalOptimized(arr: [134, 415, 784, 202, 34, 584, 543, 119, 701, 7, 700, 959, 956, 975, 484, 426, 738, 508, 201, 527, 816, 136, 668, 624, 535, 108, 1 ,965, 857, 152, 478, 344, 567, 262, 546, 953, 199 ,90, 72, 900, 449, 773, 211, 758, 100, 696, 536, 838, 204, 738, 717, 21, 874, 385, 997, 761, 845, 998, 78, 703, 502, 557, 47, 421, 819, 945, 375, 370, 35, 799, 622, 837, 924, 834, 595, 24 ,882, 483, 862, 438, 221, 931, 811, 448, 317, 809, 561, 162, 159, 640, 217, 662, 197, 616, 435, 368, 562, 162, 739, 949, 962, 713, 786, 238, 899, 733, 263, 781, 217, 477, 220, 790, 409, 383, 590, 726, 192, 152, 240, 352, 792, 458, 366, 341, 74 ,801, 709, 988, 964, 800, 938, 278, 514, 76 ,516, 413, 810 ,131 ,547, 379, 609, 119, 169, 370, 502, 112, 448, 695, 264, 688, 399, 408, 498, 765, 749, 925, 918, 458, 913, 234, 611]))
//print(equalOptimized(arr: [2, 2, 3, 7]))
//print(equalOptimized(arr: [32, 125, 120, 78]))
//print(equalOptimized(arr: [5, 10, 14, 22]))
//print(equalOptimized(arr: [520, 862, 10, 956, 498, 956, 991, 542, 523, 664, 378, 194, 76 ,90 ,753, 868, 837, 830, 932, 814, 616, 78, 103, 882, 452, 397, 899, 488, 149, 108, 723, 22, 323 ,733 ,330 ,821 ,41 ,322 ,715, 917, 986, 93 ,111, 63 ,535, 864 ,931 ,372, 47 ,215 ,539 ,15 ,294, 642, 897, 98, 391, 796, 939, 540, 257, 662, 562, 580, 747, 893, 401, 789, 215, 468, 58 ,553 ,561 ,169 ,616, 448, 385 ,900 ,173, 432, 115, 712]))

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

// https://www.hackerrank.com/challenges/common-child/problem
func commonChild2(s1: String, s2: String) -> Int {
    let x = Array(s1)
    let y = Array(s2)
    var memo = Array(repeating: 0, count: s2.count + 1)
    print(memo)
    for i in 1...s1.count {
        var prev = 0
        for j in 1...s2.count {
            let temp = memo[j]
            if String(x[i - 1]) == String(y[j - 1]) { memo[j] = prev + 1
            } else { memo[j] = max(memo[j], memo[j - 1]) }
            prev = temp
        }
    }
    return memo[s2.count]
}

print(commonChild2(s1: "SHINCHAN", s2: "NOHARAAA"))
//print(commonChild2(s1: "WEWOUCUIDGCGTRMEZEPXZFEJWISRSBBSYXAYDFEJJDLEBVHHKS", s2: "FDAGCXGKCTKWNECHMRXZWMLRYUCOCZHJRRJBOAJOQJZZVUYXIC"))
//print(commonChild(s1: "AA", s2: "BB"))
//print(commonChild2(s1: "ELGGYJWKTDHLXJRBJLRYEJWVSUFZKYHOIKBGTVUTTOCGMLEXWDSXEBKRZTQUVCJNGKKRMUUBACVOEQKBFFYBUQEMYNENKYYGUZSP", s2: "FRVIFOVJYQLVZMFBNRUTIYFBMFFFRZVBYINXLDDSVMPWSQGJZYTKMZIPEGMVOUQBKYEWEYVOLSHCMHPAZYTENRNONTJWDANAMFRX"))
