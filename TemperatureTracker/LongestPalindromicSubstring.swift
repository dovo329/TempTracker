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
        let reversedCharArr = Array(charArr.reversed())
        let N = charArr.count
        
        var matchCnt = 0
        var matchStr = ""
        var maxMatchCnt = 0
        var maxMatchStr = ""
        
        for slideStartIndex in -N+1..<N {
            matchCnt = 0
            matchStr = ""
            
            var prevCharWasMatch = false
            for compareIndex in 0..<N {
                
                let slideCompareIndex = -slideStartIndex + compareIndex
                
                if slideCompareIndex >= 0 && slideCompareIndex < N {
                    print("slideStartIndex: \(slideStartIndex) slideCompareIndex: \(slideCompareIndex) compareIndex: \(compareIndex) charArr[\(compareIndex)]: \(charArr[compareIndex]) reversedCharArr[\(slideCompareIndex)]=\(reversedCharArr[slideCompareIndex]) prevCharWasMatch: \(prevCharWasMatch) matchCnt: \(matchCnt) matchStr: \(matchStr)")
                }
                
                if slideCompareIndex >= 0 && slideCompareIndex < N && charArr[compareIndex] == reversedCharArr[slideCompareIndex] {
                    if prevCharWasMatch {
                        matchCnt += 1
                        matchStr += String(charArr[compareIndex])
                    } else {
                        matchCnt = 1
                        matchStr = String(charArr[compareIndex])
                    }
                    prevCharWasMatch = true
                } else {
                    prevCharWasMatch = false
                }
                
                if matchCnt > maxMatchCnt {
                    maxMatchCnt = matchCnt
                    maxMatchStr = matchStr
                }
            }
        }
        
        return maxMatchStr
    }
}
