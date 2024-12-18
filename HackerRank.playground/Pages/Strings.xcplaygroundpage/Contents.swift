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

//https://www.hackerrank.com/challenges/alternating-characters/problem
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

//print(commonChild2(s1: "SHINCHAN", s2: "NOHARAAA"))
//print(commonChild2(s1: "WEWOUCUIDGCGTRMEZEPXZFEJWISRSBBSYXAYDFEJJDLEBVHHKS", s2: "FDAGCXGKCTKWNECHMRXZWMLRYUCOCZHJRRJBOAJOQJZZVUYXIC"))
//print(commonChild(s1: "AA", s2: "BB"))
//print(commonChild2(s1: "ELGGYJWKTDHLXJRBJLRYEJWVSUFZKYHOIKBGTVUTTOCGMLEXWDSXEBKRZTQUVCJNGKKRMUUBACVOEQKBFFYBUQEMYNENKYYGUZSP", s2: "FRVIFOVJYQLVZMFBNRUTIYFBMFFFRZVBYINXLDDSVMPWSQGJZYTKMZIPEGMVOUQBKYEWEYVOLSHCMHPAZYTENRNONTJWDANAMFRX"))

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

// https://www.hackerrank.com/challenges/build-a-string/problem
// soumission qui plante : impossible de checker...
func buildString(a: Int, b: Int, s: String) -> Int {
    var cost = 0
    var subs = s
    var newS = ""
    var temp = ""
    while !subs.isEmpty {
        print("subs: \(subs)")
        if let firstChar = subs.first {
            temp += String(firstChar)
            print("temp: \(temp)")
            if !newS.contains(temp) {
                if temp.count <= 2 {
                    cost += a
                    if temp.count == 2 {
                        newS += temp.prefix(temp.count - 1)
                    } else {
                        newS += temp
                        subs.removeFirst()
                    }
                } else {
                    let minus = min(b, temp.count * a)
                    cost += minus
                    newS += temp.prefix(temp.count - 1)
                }
                print("newS: \(newS)")
                print("cost: \(cost)")
                temp = ""
            } else {
                subs.removeFirst()
                if subs.isEmpty {
                    if temp.count <= 2 {
                        cost += a * temp.count
                    } else {
                        let minus = min(b, temp.count * a)
                        cost += minus
                    }
                    newS += temp
                    print("newS: \(newS)")
                    print("cost: \(cost)")
                }
            }
        }
        print("------")
    }
    return cost
}

print(buildString(a: 4, b: 5, s: "aabaacaba"))
//print(buildString(a: 1, b: 3, s: "cabcjpsdaedsasedsascabcjpsddsdaedsasedsa"))
//print(buildString(a: 1, b: 3, s: "acbbqbbqbb"))

//print(buildString(a: 7890, b: 7891, s: "acbcrsjcrscrsjcrcbcrsjcrscrsjccbcrsjcrscrsjcrcbcrsjrscrsjcrcbcrsjcrscrsjccbcrsjcrscrsjcrcbcsbcbcrsjh"))



