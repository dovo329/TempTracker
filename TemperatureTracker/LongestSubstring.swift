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
        
//        int n = s.length(), ans = 0;
//        int[] index = new int[128]; // current index of character
//        // try to extend the range [i, j]
//        for (int j = 0, i = 0; j < n; j++) {
//            i = Math.max(index[s.charAt(j)], i);
//            ans = Math.max(ans, j - i + 1);
//            index[s.charAt(j)] = j + 1;
//        }
//        return ans;
        let charArr = Array(s)
        if charArr.count == 0 {
            return 0
        }
        
        var maxLen = 0
        //var maxSubstr = ""

        var startIndex = 0
        //var endIndex = 0
        
        //var curCharSet = Set<Character>()
        var charIndexDict = [Character: Int]()

        for testIndex in 0..<charArr.count {

            let testChar = charArr[testIndex]
            if let dupTestIndex = charIndexDict[testChar] {
                startIndex = max(dupTestIndex + 1, startIndex)
            }
            charIndexDict[testChar] = testIndex
            
            let curLen = testIndex - startIndex + 1
            if (curLen > maxLen) {
                //maxSubstr = String(charArr[startIndex...testIndex])
                maxLen = curLen
            }
        }
        
        //print("maxSubstr: \(maxSubstr) of length \(maxLen)")
        return maxLen
    }
}
