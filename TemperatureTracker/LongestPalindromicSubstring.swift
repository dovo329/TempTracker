//
//  LongestPalindromicSubstring.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/24/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//

import Foundation

class LongestPalindromicSubstring {
    func longestPalindrome(_ s: String) -> String {
        let charArr = Array(s)
        let N = charArr.count
        var maxLen = 0
        var maxPalindrome = ""
        
        var testArr = Array<Character>()
        
        nextStartIndex: for startIndex in 0..<N {

            testArr.removeAll()
            //print("startIndex: \(startIndex)")
            
            for searchIndex in startIndex..<N {
                //print("searchIndex: \(searchIndex)")
                
                let testChar = charArr[searchIndex]
                testArr.append(testChar)
                    
                // I must check for a palindrome each time
                let reversedTestArr = Array<Character>(testArr.reversed())
                
                if testArr == reversedTestArr {
                    //print("\(testArr) is a palindrome")
                    if testArr.count > maxLen {
                        maxLen = testArr.count
                        maxPalindrome = String(testArr)
                    }
                } else {
                    //print("\(testArr) may or may not be a palindrome, postponing judgement...")
                }
            }
        }
        
        return maxPalindrome
    }
}
