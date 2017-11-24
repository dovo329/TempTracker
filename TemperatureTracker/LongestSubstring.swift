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
        //var maxSubstr = ""

        var startIndex = 0
        var endIndex = 0
        
        var curCharSet = Set<Character>()
        
        while (endIndex < charArr.count) {
            curCharSet.insert(charArr[endIndex])
            
            let curLen = endIndex - startIndex + 1
            if (curLen > maxLen) {
                //maxSubstr = String(charArr[startIndex...endIndex])
                maxLen = curLen
            }
            
            if (endIndex+1 < charArr.count && curCharSet.contains(charArr[endIndex+1])) {
                curCharSet.remove(charArr[startIndex])
                startIndex += 1
            } else {
                endIndex += 1
            }
            
            endIndex = max(startIndex, endIndex)
        }
        
        //print("maxSubstr: \(maxSubstr) of length \(maxLen)")
        return maxLen
    }
}
