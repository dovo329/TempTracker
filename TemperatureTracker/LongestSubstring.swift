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
        
        var testSubCharArr = [Character]()
        
        startIndex: for startIndex in 0..<charArr.count {
            curSubstr = String(charArr[startIndex])
            curLen = 1
            if (curLen > maxLen) {
                maxLen = curLen
                maxSubstr = curSubstr
            }
            
            endIndex: for endIndex in (startIndex+1)..<charArr.count {
                testSubCharArr = Array(charArr[startIndex..<endIndex])
                let char = charArr[endIndex]
                if (testSubCharArr.contains(char)) {
                    continue startIndex
                    
                } else {
                    
                    curSubstr += String(char)
                    curLen += 1
                    
                    if (curLen > maxLen) {
                        maxLen = curLen
                        maxSubstr = curSubstr
                    }
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
