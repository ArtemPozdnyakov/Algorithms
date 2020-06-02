//
//  main.swift
//  Algorithms
//
//  Created by admin on 6/2/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import Foundation

func anagramSolution(str: String, str2: String) -> Bool {
    var array1 = [Int](repeating: 0, count: 28)
    var array2 = [Int](repeating: 0, count: 28)
    
    let aPos: UInt32 = 97
    
    for ch in str.unicodeScalars {
        let pos = Int(ch.value - aPos)
        array1[pos] = array1[pos] + 1
    }
    
    for ch in str2.unicodeScalars {
        let pos = Int(ch.value - aPos)
        array2[pos] = array2[pos] + 1
    }
    
    var maches = true
    var j = 0
    
    while j < 28 && maches {
        if array1[j] == array2[j]{
            j += 1
        } else {
            maches = false
        }
    }
    return maches
}





func binaryS(key: Int, list:[Int]) -> Int? {
    var low = 0
    var high = list.count - 1
    
    while low <= high {
         var mid = low + (high - low) / 2
        if key < list[mid]{
            high = mid - 1
        } else if key > list[mid] {
           low = mid + 1
        } else {
            return mid
        }
    }
    return nil
}



func bubbleSort<T: Comparable>( array: inout [T]) -> [T] {
    
    for i in 0..<array.count {
        var pass = (array.count - 1) - i
        
        for j in 0..<pass {
            var key = array[j]
            
            if key > array[j + 1] {
                let temp = array[j + 1]
                array[j + 1] = key
                array[j] = temp
            }
        }
    }
    print(array)
    return array
}



func merge<T: Comparable>(number1: [T], number2: [T]) -> [T] {
    if number1.isEmpty {
        return number2
    } else if number2.isEmpty {
        return number1
    } else if number1[0] < number2[0] {
        return [number1[0]] + merge(number1: Array(number1[1..<number1.count]), number2: number2)
    } else {
        return [number2[0]] + merge(number1: number1, number2: Array(number2[1..<number2.count]))
    }
}

func mergeSort<T: Comparable>(arrays: [T]) -> [T] {
    if arrays.count < 2 {
        return arrays
    } else {
        let  half = (arrays.count / 2)
        return merge(number1: mergeSort(arrays: Array(arrays[0..<half])),
                     number2: mergeSort(arrays: Array(arrays[half..<arrays.count])))
    }
}




func api(_ addres: String) -> String {
    var str = ""
    
    for ch in addres {
        if ch == "." {
            str += "[\(ch)]"
        } else {
            str = str + String(ch)
        }
    }
    print(str)
    return str
}

//api("225.100.50.0")



func steps(_ num: Int) -> Int {
    
    var step = 0
    var number = num
    
    while number != 0 {
        if number % 2 == 0 {
            number = number / 2
            step += 1
        } else {
            number = number - 1
            step += 1
        }
    }
    print(step)
    return step
}

//steps(14)




func stringCount(_ J: String, _ S: String) -> Int {
    var array1: [String] = []
    var array2: [String] = []
    var count = 0
    var one = 0
    
    for ch in J {
        array1.append(String(ch))
    }
    for ch in S {
           array2.append(String(ch))
       }

    
    while one < array1.count {
        
        for i in 0..<array2.count {
            if array2[i] == array1[one] {
                count += 1
            }
        }
        
        if one < array1.count{
            one += 1
        }
        
    }
    print(count)
    return count
}

//stringCount("sHHhSvc", "shS")







func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    if nums.count < 2 {
        return [0]
    }
    
    var count = 0
    var index = 0
    var result: [Int] = []
    var n = 0
    
    while n <= nums.count - 1 {
        
        for i in 0..<nums.count {
            if nums[index] > nums[i] {
                count += 1
            } else {
                count += 0
            }
        }
           n += 1
           result.append(count)
           count = 0
           index += 1
    }
    print(result)
    return result
}


//smallerNumbersThanCurrent([8, 3, 2, 4, 5])

//   не моя реализация, но решение топ
func numbersThanCurrent(_ nums: [Int]) -> [Int] {
    var dict : [Int : Int] = [:]
    let arr = nums.sorted()
    for i in 0..<arr.count{
        if dict[arr[i]] == nil{
            dict[arr[i]] = i
        }
    }
    var final : [Int] = []
    for i in 0..<nums.count{
        final.append(dict[nums[i]]!)
    }
    return final
}
//numbersThanCurrent([8, 3, 2, 4, 5])




//[1, 2, 3, 4]
func decompressRLElist(_ nums: [Int]) -> [Int] {
    var freq = 0
    var val = 1
    var q = 0
    var result = [Int]()

    while q <= nums.count - 2 {
        for i in 1...nums[freq] {
            result.append(nums[val])
        }
        freq += 2
        val += 2
        q += 2
    }
    print(result)
    return result
}

//decompressRLElist([1,1,2,3])




func subtractProductAndSum(_ n: Int) -> Int {
    var array = [Int]()
    var str = String(n)
    var oneResult = 1
    var twoResult = 0
    
    
    for i in str {
        array.append(Int(String(i))!)
    }
    
    for i in array {
        oneResult *= i
    }
    
    for i in array {
        twoResult += i
    }
    print(oneResult - twoResult)
    return oneResult - twoResult
}


//subtractProductAndSum(705)





func findNumbers(_ nums: [Int]) -> Int {
 
    var count = 0
    var count2 = 0
    var str = ""
    
    for i in nums {
        str = String(i)
        
        for j in str {
            count += 1
        }
        
        if count % 2 == 0 {
            count2 += 1
        }
        count = 0
    }
    print(count2)
    return count2
    
}

//findNumbers([555,901,482,1771])






func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
    
    nums.enumerated().reduce(into: [Int](), { $0.insert($1.1, at: index[$1.0]) })

}

//createTargetArray([1,2,3,4,0], [0,1,2,3,0])





func reverseString(_ s: inout [Character]) {
   print(s.reverse())
   return s.reverse()
}

//reverseString(["a", "b", "c"])






 // Definition for a binary tree node.
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
    
      public init() {
        self.val = 0;
        self.left = nil;
        self.right = nil;
        
    }
    
      public init(_ val: Int) {
        self.val = val;
        self.left = nil;
        self.right = nil;
        
    }
      public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
          self.val = val
          self.left = left
          self.right = right
      }
  }
 
// Бинарное дерево
// реализация не моя
//TODO: понять как работает


    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil
            {
                return 0
            }
            else
            {
                return 1 + max(maxDepth(root!.left),maxDepth(root!.right))
            }
        }
/////////////////////////////////////////////////////







func singleNumber(_ nums: [Int]) -> Int {
    var dict: [Int: Int] = [:]
    
    for i in 0..<nums.count {
        if dict[nums[i]] == nil {
            dict[nums[i]] = i
        } else {
            dict.removeValue(forKey: nums[i])
        }
    }
    print(nums[dict[dict.first!.key]!])
    return nums[dict[dict.first!.key]!]
}

//singleNumber([1, 1, 2])






func fizzBuzz(_ n: Int) -> [String] {
    var arr: [String] = []
    
    for i in 1...n {
        if i % 3 == 0 && i % 5 == 0 {
            arr.append("FizzBuzz")
        } else if i % 5 == 0 {
            arr.append("Buzz")
        } else if i % 3 == 0 {
             arr.append("Fizz")
        } else {
            arr.append("\(i)")
        }
    }
    print(arr)
    return arr
}

//fizzBuzz(3)







func moveZeroes(_ nums: inout [Int]) {
    var dict: [Int: Int] = [:]
    var index = 0
    
    for i in 0..<nums.count - 1{
        if nums[i] == 0 {
            dict[index] = i
            index += 1
        }
    }
    
   
   
    while index != 0 {
        nums.remove(at: dict[index - 1]!)
        nums.append(0)
        index -= 1
    }
   
    
    print(nums)
}

var arra = [0,0,1]
//moveZeroes(&arra)








func majorityElement(_ nums: [Int]) -> Int {
    var dict: [Int: Int] = [:]
    var arr = nums.sorted()
    var item = 1
    var item1 = 1
    var keyItem = 0
    var keyNumber = 0
    
    for i in 0..<arr.count {
      if dict[arr[i]] == nil {
            dict[arr[i]] = item
        item1 = 1
      } else {
        item1 += 1
        dict[arr[i]] = item1
        }
    }
    
    for key in dict.keys {
        if dict[key]! > keyNumber {
            keyNumber = dict[key]!
            keyItem = key
        }
    }
   
   
    print(keyItem)
    return keyItem
}



//majorityElement([3,2,3])







func maxProfit(_ prices: [Int]) -> Int {
    var a = 0
    var i = 1
    
    while i <= prices.count - 1{
        if prices[i] > prices[i - 1] {
            a += prices[i] - prices[i - 1]
        }
        i += 1
    }
    print(a)
    return a
}


maxProfit([1,2,3,4,5])









func containsDuplicate(_ nums: [Int]) -> Bool {
    var dict: [Int: Int] = [:]
    var answer = false
    var index = 0
   
    
    while index <= nums.count - 1{
        if answer == true {
            break
        } else {
            if dict[nums[index]] == nil {
                dict[nums[index]] = index
            } else {
                answer = true
            }
            index += 1
        }
    }
    
    
    print(answer)
    return answer
}

//containsDuplicate([1,2,3,4,5])








func romanToInt(_ s: String) -> Int {
    var index = 0
    var answer = 0
    var arr: [String] = []
    var dict: [String: Int] = ["I": 1,
                               "IV": 4,
                               "V": 5,
                               "IX": 9,
                               "X": 10,
                               "XL": 40,
                               "L": 50,
                               "XC": 90,
                               "C": 100,
                               "CD": 400,
                               "D": 500,
                               "CM": 900,
                               "M": 1000]
    
    
    for (i, j) in s.enumerated() {
        arr.append(String(j))
    }
    
    while index <= arr.count - 1 {
        if index + 1 <= arr.count - 1 {
            if arr[index] + arr[index + 1] == "IV" || arr[index] + arr[index + 1] == "IX" {
                answer += dict[arr[index] + arr[index + 1]]!
                index += 1
            }else if arr[index] + arr[index + 1] == "XL" || arr[index] + arr[index + 1] == "XC" {
                answer += dict[arr[index] + arr[index + 1]]!
                index += 1
            } else if arr[index] + arr[index + 1] == "CD" || arr[index] + arr[index + 1] == "CM" {
                answer += dict[arr[index] + arr[index + 1]]!
                index += 1
            } else {
                answer += dict[arr[index]]!
            }
        } else {
            answer += dict[arr[index]]!
        }
        index += 1
    }
    print(answer)
    return answer
}

//romanToInt("VIII")







func titleToNumber(_ s: String) -> Int {
   print(s.unicodeScalars.reduce(0) { $0 * 26 + Int($1.value) - 64 })
   return s.unicodeScalars.reduce(0) { $0 * 26 + Int($1.value) - 64 }
}

//titleToNumber("AA")








func firstUniqChar(_ s: String) -> Int {
    var dict: [Character: Int] = [:]
    var arr: [Character] = []
    var index = 0
    var a = 1
    var answer = 0
    var maches = false
    var d = 0
    
    for (i, j) in s.enumerated() {
        arr.append(j)
    }
    
    while index <= arr.count - 1{
        if dict[arr[index]] == nil {
            dict[arr[index]] = a
        } else {
            dict[arr[index]]! += a
        }
        index += 1
    }
    
    while !maches && d <= arr.count - 1{
        if dict[arr[d]] == 1 {
            answer = d
            maches = true
        }
        d += 1
    }
    
    if !maches {
        answer = -1
    }
    
    print(answer)
    return answer
}

//firstUniqChar("aababaa")








func missingNumber(_ nums: [Int]) -> Int {
    var arr = nums.sorted()
    var index = 0
    var answer = 0
    var maches = false

    for i in 0..<arr.count {
        if arr[i] == index {
            index += 1
        } else {
            answer = index
            maches = true
        }
    }
    
    if !maches {
        answer = index
    }
    print(answer)
    return answer
}

//missingNumber([3,0,1])





func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 0
    var j = 1
    
    if nums.count == 1 {
        return nums.count
    }
    
    while j <= nums.count - 1{
        if nums[i] == nums[j] {
            nums.remove(at: j)
        } else {
            i = j
            j += 1
        }
    }
    i = j
    print(i)
    return i
}

var v = [1,1]
//removeDuplicates(&v)



func rotate(_ nums: inout [Int], _ k: Int) {
    
    if nums.count > 1 || k > 0{
        for i in 1...k {
            let item = nums.last
            nums.removeLast()
            nums.insert(item!, at: 0)
        }
    }
}

var nums = [1,2]
// rotate(&nums, 1)







func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
     
        var result = [Int]()
        var table = [Int: Int]()
        
        for num in nums1 {
            if let val = table[num] {
                table[num] = val + 1
            } else {
                table[num] = 1
            }
        }
        
        for num in nums2 {
            if let val = table[num] {
                if val > 0 {
                    result.append(num)
                    table[num] = val - 1
                }
            }
        }
        
        return result
    }

//intersect2([4,9,5], [9,4,9,8,4])





func plusOne(_ digits: [Int]) -> [Int] {
    var result = digits
    
    for i in (0..<result.count).reversed() {
        if result[i] != 9 {
            result[i] += 1
            break
        } else if i != 0 {
            result[i] = 0
        }else {
            result[i] = 1
            result.append(0)
        }
    }

    print(result)
    return result
    
}

//plusOne([9,9])




func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var result: [Int] = []
    var dict: [Int: Int] = [:]
    
    for i in 0..<nums.count {
        if let index = dict[target - nums[i]] {
            result.append(index)
            result.append(i)
            print(result)
            return result
        }
        dict[nums[i]] = i
    }
    print(result)
    return result
}

//twoSum2([3,2,4], 6)





func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    var set: Set<String> = Set()
         for x in 0..<9 {
             for y in 0..<9 where board[x][y] != "." {
                 if !set.insert("\(x)(\(board[x][y]))").inserted ||
                     !set.insert("(\(board[x][y]))\(y)").inserted ||
                     !set.insert("\(x / 3)(\(board[x][y]))\(y / 3)").inserted {
                         return false
                     }
             }
         }
         return true
     }


/*isValidSudoku([
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
])
*/





func rotate(_ matrix: inout [[Int]]) {
    guard let firstRow = matrix.first else {
               return
           }
           let edgeLength = firstRow.count
           var newMatrix = matrix
           for r in 0..<edgeLength {
               for c in 0..<edgeLength {
                   let n = matrix[r][c]
                   newMatrix[c][edgeLength - r - 1] = n
               }
           }
           matrix = newMatrix
       }


var j = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
//rotate(&j)




func replaceElements(_ arr: [Int]) -> [Int] {
    var array = arr
    var lastMax = arr[arr.count - 1]
    array[array.count - 1] = -1
    
    for i in (0..<arr.count - 1).reversed() {
        let check = arr[i]
        array[i] = lastMax
        lastMax = max(lastMax, check)
    }
    
    return array
}

//replaceElements([17,18,5,4,6,1])





func sortArrayByParity(_ A: [Int]) -> [Int] {
    var arr: [Int] = []
    var arr2: [Int] = []
    
    for i in 0..<A.count {
        A[i] % 2 == 0 ? arr.append(A[i]): arr2.append(A[i])
    }
    
    print(arr + arr2)
    return arr + arr2
}


//sortArrayByParity([3,1,2,4])




func sortedSquares(_ A: [Int]) -> [Int] {
    var array: [Int] = []
    
    
    for i in 0..<A.count {
        array.append(A[i] * A[i])
    }
    
    array.sort()
    print(array)
    return array
}

//sortedSquares([-4,-1,0,3,10])




func reverse(_ x: Int) -> Int {
    var f = Int32.max
    var s = String(x)
    var a = ""
    var minus = "-"
    var result = 0
    if x < 0 {
        s.removeFirst()
       a = String(s.reversed())
       // a.removeFirst()
        a = minus + a
    } else {
       a = String(s.reversed())
    }
    
    result = Int(a)!
    if result > Int32.max || result < Int32.min {
        return 0
    }
    return result
}

//reverse(-2147483648)




func isPalindrome(_ s: String) -> Bool {
    var reversed = ""

    for item in s.lowercased().reversed() where item.isLetter || item.isNumber {
        reversed.append(item)
    }

    return reversed == String(reversed.reversed())
}
   

//isPalindrome("A man, a plan, a canal: Panama")





func myAtoi(_ str: String) -> Int {
 
    var s = ""
    var r: Double = 0.0
    
    if str.count == 0 || str == "-" || str == "+" {
        return Int(r)
    }
    
    for (j, i) in str.enumerated() {
        if i == " " && s != ""{
            if Int(s) == nil {
                return Int(r)
            } else {
                break
            }
        } else {
            if i == " " || i == "-" || i == "+" {
                if i == "-" || i == "+"{
                    if s == "" {
                        s += String(i)
                    } else {
                        if  Double(s) != nil {
                            r = Double(s)!
                            print(Int(r))
                            return Int(r)
                        } else {
                            print(Int(r))
                            return Int(r)
                        }
                        
                    }
                } else {
                    if Int(String(i)) != nil {
                        s += String(i)
                    }
                }
            } else {
                if Int(String(i)) != nil {
                    s += String(i)
                } else {
                    if s != "" {
                        break
                    } else {
                        r = 0
                        print(Int(r))
                        return Int(r)
                    }
                }
            }
        }
    }
    
    
    if Double(s) != nil {
        r = Double(s)!
    } else {
        r = 0
    }
    
    
    if r > Double(Int32.max) {
        r = Double(Int(Int32.max))
    } else if r < Double(Int32.min) {
        r = Double(Int(Int32.min))
    }
    print(Int(r))
    return Int(r)
}


//myAtoi("+-2")




func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack.count == needle.count {
        return haystack != needle ? -1 : 0
        
    } else if let index = haystack.range(of: needle) {
        return haystack.distance(from: haystack.startIndex, to: index.lowerBound)
    } else {
        return needle.isEmpty ? 0 : -1
    }

}

//strStr("mississippi", "issip")





func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 0 else { return "" }
    var commonString = strs[0]
    
    for str in strs {
        while !str.hasPrefix(commonString) {
            commonString = String(commonString.dropLast())
        }
    }

    return commonString
    
}

//longestCommonPrefix(["flower","flow","flight"])





func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var count = 0
    var arr: [Int] = []
    var result = 0
    
    for i in 0..<nums.count {
        if nums[i] == 1 {
            count += 1
        } else {
            if count != 0 {
                arr.append(count)
                count = 0
            }
        }
        if i == nums.count - 1 {
        arr.append(count)
        }
    }
    result = arr.max() ?? 0
    print(result)
    return result
}

//findMaxConsecutiveOnes([0])





func duplicateZeros(_ arr: inout [Int]) {
    var index = 0
    
    while index <= arr.count - 1 {
        if arr[index] == 0 {
            arr.insert(0, at: index + 1)
            arr.removeLast()
            print(arr)
            index += 2
        } else {
            index += 1
        }
        
    }
}


//var mas = [1,0,2,3,0,4,5,0]
//duplicateZeros(&mas)






func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

       for i in 0..<n {
            nums1[m + i] = nums2[i]
        }
        nums1.sort { $0 < $1}
        print(nums1)
}




//var car =      [1,2,3,0,0,0]
//merge(&car, 3, [2,5,6], 3)






func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var index = 0
    
    while index <= nums.count - 1 {
        if nums[index] == val {
            nums.remove(at: index)
        } else {
            index += 1
        }
    }
    return nums.count
}

//var vac = [3,2,2,3]
//removeElement(&vac, 3)





func checkIfExist(_ arr: [Int]) -> Bool {
    var answer = true
    var dict: [Int: Int] = [:]
    
    for i in 0..<arr.count {
        if dict[arr[i]] == nil && arr[i] != 0{
            dict[arr[i]] = i
        }
     }
    
    
    for j in 0..<arr.count {
        if arr[j] % 2 == 0 {
            let item = arr[j] / 2
            if dict[item] != nil {
                answer = true
                return answer
            }
        }
        answer = false
    }
    
    
    
    return answer
}


//checkIfExist([-2,0,10,-19,4,6,-8])




func validMountainArray(_ A: [Int]) -> Bool {
    var answer1 = false
    var itemMax = A.max()
    var index = A.firstIndex(of: itemMax ?? 0)
    
    if A.count < 3 {
        return false
    }
    
    for i in 0..<index! {
        if A[i] < A[i + 1] {
            answer1 = true
        } else {
            answer1 = false
        }
    }
    
    for j in index!..<A.count - 1{
        if A[j] > A[j + 1] {
            answer1 = true
        } else {
            answer1 = false
            return answer1
        }
    }
    return answer1
}

//validMountainArray([0,1,2,3,4,5,6,7,8,9])




func heightChecker(_ heights: [Int]) -> Int {
    var count = 0
    var arr = heights.sorted()
    
    for i in 0..<heights.count where arr[i] != heights[i] {
            count += 1
        
    }
      return count
}


//heightChecker([1,1,4,2,1,3])




func thirdMax(_ nums: [Int]) -> Int {
    var count = 0
    var arr = nums.sorted()
    var index = 0
    var a = 0
    
    if nums.count == 1 {
        count = nums[0]
        return count
    } else if nums.isEmpty {
        return count
    }
    
    while index < arr.count - 1 {
        if arr[index] == arr[index + 1] {
            arr.remove(at: index)
        } else {
            index += 1
        }
    }
    
    
    if arr.count < 3 {
        count = arr.max()!
    } else if arr.count >= 3 {
        for i in 0..<arr.count {
            if a < 3{
            count = arr.max()!
            arr.removeAll(where: { $0 == count})
                a += 1
            }
        }
        print(count)
    }
    
    print(arr)
    print(count)
    
    
    return count
}

//thirdMax([3, 2, 1, 4])






func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    if nums.isEmpty {
        return nums
    }
    
    return Array(
        Set(1...nums.count).subtracting(nums)
    )
}

//findDisappearedNumbers([1,1])





class Nodes<T: Equatable> {
    var item: T
    var next: Nodes<T>?
    
    init(element: T) {
        item = element
    }
    
    func add(newItem: T) {
        if let nextNode = next {
            nextNode.add(newItem: newItem)
        } else {
            next = Nodes<T>(element: newItem)
        }
    }
}


class MyLinkedList<T: Equatable> {
    var head: Nodes<T>?
    var tail: Nodes<T>?
    
    func addHead(item: T) {
        if head != nil {
            let oldHead = head
            head = Nodes<T>(element: item)
            head?.next = oldHead
        } else {
            head = Nodes<T>(element: item)
        }
    }
    
    func addAtIndex(index: Int, item: T) {
        var count = 0
        if head != nil {
            var current = head
            var prev = head
            
            while index != count && current?.next != nil {
                prev = current
                current = current?.next
                count += 1
            }
            
            if let valeu = current {
                if index == count {
                  prev?.next = Nodes<T>(element: item)
                    let node = prev?.next
                    node?.next = valeu
                }
            }
        }
    }
    
    
    func addTail(item: T) {
        if head != nil {
            var current = head
            var prev = head
            
            while current!.next != nil {
                prev = current
                current = current!.next
            }
            
            if current?.next == nil {
                current?.next = Nodes<T>(element: item)
            }
        }
    }
    
    func getNodeAtIndex(index: Int) -> String {
        var count = 0
        var str = ""
        
        if head != nil {
            var current = head
            var prev = head
            
            while index != count && current?.next != nil {
                prev = current
                current = current?.next
                count += 1
            }
            
            if let nodes = current {
                if index == count {
                    str += "\(nodes.item)"
                } else {
                    str += "-1"
                }
            }
        }
       return str
    }
    
    
    func removeAtIndex(index: Int) {
        var count = 0
        if head != nil {
            var current = head
            var prev = head
            
            while index != count && current?.next != nil {
                prev = current
                current = current?.next
                count += 1
            }
            
            if let deleted = current {
                if index == count {
                    if let nexted = deleted.next {
                        prev?.next = nexted
                        deleted.next = nil
                    } else {
                        prev?.next = nil
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    func remove(item: T) {
        if head != nil {
            if head!.item == item {
                head = head?.next
            } else {
                var current = head
                var prev = head
                
                
                while current!.next != nil && current!.item != item {
                    prev = current
                    current = current!.next
                }
                
                if let deleted = current {
                    if deleted.item == item {
                        if let nexted = deleted.next {
                            prev?.next = nexted
                            deleted.next = nil
                        } else {
                            prev?.next = nil
                        }
                    }
                }
                
            }
        }
    }
    
    
    
    
    var size: Int {
        var current = head
        var count = 0
        
        while current != nil {
            current = current?.next
            count += 1
        }
        return count
    }
    
}


extension MyLinkedList {
    
    func printList() -> String {
        var str = ""
        var current = head
        
        while current != nil {
            str += "\(current!.item) -> "
            current = current?.next
        }
        return str
    }
}






//var listMy = MyLinkedList<String>()

//listMy.addHead(item: "a")
//listMy.addTail(item: "b")
//listMy.addTail(item: "c")
//listMy.addTail(item: "d")

//print(listMy.printList())
//print(listMy.getNodeAtIndex(index: 2))
//listMy.removeAtIndex(index: 2)
//print(listMy.printList())
//listMy.addAtIndex(index: 2, item: "c")
//print(listMy.printList())












func numTeams(_ rating: [Int]) -> Int {
    var answer = 0
    var dict: [Int: [Int]] = [:]
    var arrMax: [Int] = []
    var arrMin: [Int] = []
    
    var i = 0
    var j = 0
    var k = 0
    
    var x = 0
    var y = x + 1
    
    while x <= rating.count - 3 {
        while y <= rating.count - 1 {
            if rating[x] > rating[y] {
                arrMin.append(rating[y])
            } else if rating[x] < rating[y] {
                arrMax.append(rating[y])
            }
            y += 1
        }
        
        if arrMax.count >= 2 {
            dict[rating[x]] = arrMax
        }
        if arrMin.count >= 2 {
            if dict[rating[x]] != nil {
               dict[rating[x]]! += arrMin
            } else {
                dict[rating[x]] = arrMin
            }
        }
        arrMin.removeAll()
        arrMax.removeAll()
        x += 1
        y = x + 1
    }
    x = 0
    
    
    for x in dict.keys {
        var arrays = dict[x]
        i = Int(x)
        while j <= arrays!.count - 2 {
            while k <= arrays!.count - 1 {
                if i > arrays![j] && arrays![j] > arrays![k] {
                   answer += 1
                }else if i < arrays![j] && arrays![j] < arrays![k] {
                    answer += 1
                }
                 k += 1
            }
            j += 1
            k = j + 1
        }
        k = 0
        j = 0
        arrays?.removeAll()
    }
    
    
    
    
    print(answer)
    return answer
}

//numTeams([4,7,9,5,10,8,2,1,6])






class Codec {
    var dict: [String: String] = [:]
    var alfStr = "abcdefghijklmnopqrstuvwxyz"
    var key = ""
    
    
    func encode(_ longUrl: String) -> String {
        var doubleCount = longUrl.count
        var slash = 0
        
        
        for i in longUrl {
            if slash == 3 {
                break
            } else {
                if i == "/" {
                    slash += 1
                }
                key += String(i)
            }
        }
        
        doubleCount = (longUrl.count - key.count) / 2
        for j in 0..<doubleCount {
            key += String(alfStr.randomElement()!)
        }
        
        print(key)
        dict[key] = longUrl
        
        return key
    }
    
   
    func decode(_ shortUrl: String) -> String {
    
        if dict[shortUrl] != nil {
            print(dict[shortUrl]!)
            return dict[shortUrl]!
        } else {
            return "Not address"
        }
    }
}

//var codes = Codec()
//codes.encode("https://leetcode.com/problems/design-tinyurl")
//codes.decode(codes.key)





func arrayInArray(array: [Int]) -> Int {
    var first: Int?
    var second: Int?
    var numbers = array.sorted()
    var index = 0
    var count = 0
    
    for i in 0..<array.count {
        if array[i] != numbers[i] {
            if first == nil {
             first = i
            }
        } else {
            second = i
        }
    }
    
    print(first!, second! - 1)
    
   count = array[first!...second! - 1].count
    
    
    return count
}


//arrayInArray(array: [1,4,3,2,6])





func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var answer: [Bool] = []
    var index = candies.max()
    
    for i in 0..<candies.count {
        if candies[i] == index! {
            answer.insert(true, at: i)
        } else if candies[i] + extraCandies >= index! {
            answer.insert(true, at: i)
        } else {
            answer.insert(false, at: i)
        }
    }
    print(answer)
    return answer
       
   }

//kidsWithCandies([12,1,12], 10)



func sotr2(nums: [Int]) -> [Int] {
    var arr = nums
    var index1 = 1

    while index1 < arr.count {
        if arr[index1] < arr[index1 - 1] {
            let temp = arr[index1]
            var arr2 = arr[0...index1]
            for i in 0..<arr2.count {
                if temp > arr2[i] && arr[i + 1] == nil {
                    arr.remove(at: arr[index1 + 1])
                    arr.append(temp)
                } else if temp < arr2[i] {
                    arr.remove(at: index1)
                    arr.insert(temp, at: i)
                    break
                }
            }
        }
        index1 += 1
    }
    print(arr)
    return arr
}


//sotr2(nums: [1, 3, 5, 7, 2, 34, 11, 1, 7, 4, 90, 67, 21, 32,13,77,8,0])




func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
    var answer = true
    for i in 0..<target.count {
        let item = target[i]
        if arr.contains(item) {
        } else {
            answer = false
            print(answer)
            return answer
        }
    }
    print(answer)
    return answer
}

//canBeEqual([3,7,9], [3,7,11])




func heightCheckerRRR(_ heights: [Int]) -> Int {
    var arr = heights.sorted()
    var item = 0
    for i in 0..<heights.count {
        if heights[i] != arr[i] {
            item += 1
        }
    }
    print(item)
    return item
}

//heightCheckerRRR([1,2,3,4,5])





func isOneBitCharacter(_ bits: [Int]) -> Bool {
    var answer = true
    var arr = bits
    var index = 0
    var item = 0
    
    
    while index <= arr.count - 1{
        if arr[index] == 1 && arr[index + 1] == 0 {
           arr.remove(at: index)
           arr.remove(at: index)
            item = 2
        } else if arr[index] == 1 && arr[index + 1] == 1 {
           arr.remove(at: index)
           arr.remove(at: index)
            item = 2
        } else if arr[index] == 0 {
          item =  arr.remove(at: index)
            item = 1
        }
    }
    print(item)
    if item == 1 {
        return answer
    } else {
        answer = false
        return answer
    }
    
    return true
}

//isOneBitCharacter([1,1,0,1,0,1,0])


func reverseVowels(_ s: String) -> String {
    var arr: [Character] = ["A", "E", "I", "O", "U"]
    var arr2: [Character] = []
    var str = ""
    
    for (i,j) in s.enumerated(){
        let v = j.uppercased()
        if arr.contains(Character(v)) {
            arr2.insert(j, at: 0)
        }
    }
    
    for (x,z) in s.enumerated() {
        let v = z.uppercased()
       // if arr.contains(Character(v)) == nil {
         //   str += String(z)
        //}
        if arr.contains(Character(v)) {
            str += String(arr2.remove(at: 0))
        } else {
            str += String(z)
        }
        
    }
    
    print(str)
    return str
}

//reverseVowels("Leetcode")




class Trie {
    var arrStr: [String] = []
    var answer = true

    /** Initialize your data structure here. */
    init() {
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        arrStr.append(word)
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
       return arrStr.contains(word)
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        for i in 0..<arrStr.count {
            var item = arrStr[i]
            if item.hasPrefix(prefix) {
                answer = true
                return answer
            } else {
                answer = false
                return answer
            }
        }
        return answer
    }
}


var lf = Trie()
lf.insert("apple")
print(lf.search("app"))
print(lf.search("apple"))
print(lf.startsWith("app"))
