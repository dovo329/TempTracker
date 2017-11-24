//
//  LongestSubstring.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/22/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//
//Given a string, find the length of the longest substring without repeating characters.
//
//Examples:
//
//Given "abcabcbb", the answer is "abc", which the length is 3.
//
//Given "bbbbb", the answer is "b", with the length of 1.
//
//Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

import Foundation

class LongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        let charArr = Array(s)
        
        var maxLen = 0
        var curLen = 0
        var maxSubstr = ""
        var curSubstr = ""
        
        var endIndex = 0
        
        //var testSubCharArr = [Character]()
        
        startIndexLoop: for startIndex in 0..<charArr.count {
            if ((charArr.count - 1) - startIndex) < maxLen {
                break startIndexLoop
            }
            
            endIndex = max(startIndex, endIndex)

            endIndexLoop: while endIndex<charArr.count {

                curSubstr = String(charArr[startIndex...endIndex])
                curLen = endIndex - startIndex + 1
                
                if (curLen > maxLen) {
                    maxLen = curLen
                    maxSubstr = curSubstr
                }
                
                let testIndex = endIndex + 1
                if (testIndex == charArr.count) {
                    break startIndexLoop
                }
                let char = charArr[testIndex]
                if (curSubstr.contains(char)) {
                    continue startIndexLoop

                } else {
                    endIndex += 1
                }
            }
        }
        
        if (curLen > maxLen) {
            maxLen = curLen
            maxSubstr = curSubstr
        }
        
        print("maxSubstr: \(maxSubstr) of length \(maxLen)")
        return maxLen
    }
}
