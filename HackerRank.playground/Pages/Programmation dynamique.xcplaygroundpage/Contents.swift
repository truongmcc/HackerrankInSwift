//: [Previous](@previous)

//import Foundation

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
        else if max - min < 5 { diff = 2 }
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
print(equal2(arr: [11, 7, 12, 3]))
//print(equal2(arr: [520, 862, 10, 956, 498, 956, 991, 542, 523, 664, 378, 194, 76 ,90 ,753, 868, 837, 830, 932, 814, 616, 78, 103, 882, 452, 397, 899, 488, 149, 108, 723, 22, 323 ,733 ,330 ,821 ,41 ,322 ,715, 917, 986, 93 ,111, 63 ,535, 864 ,931 ,372, 47 ,215 ,539 ,15 ,294, 642, 897, 98, 391, 796, 939, 540, 257, 662, 562, 580, 747, 893, 401, 789, 215, 468, 58 ,553 ,561 ,169 ,616, 448, 385 ,900 ,173, 432, 115, 712]))

// https://www.hackerrank.com/challenges/equal/problem
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
print(equalOptimized(arr: [11, 7, 12, 3]))
