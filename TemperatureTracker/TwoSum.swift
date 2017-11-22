//
//  TwoSum.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/22/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//
//
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//Example:
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].

import Foundation

class TwoSum {
    class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedArr = nums.sorted(by: < )
        let resultNoneFound = [0, 0]
        
        nextStartTerm: for startTerm in 0..<sortedArr.count-1 {
            for i in startTerm+1..<sortedArr.count {
                let leftTerm = sortedArr[startTerm]
                let rightTerm = sortedArr[i]
                let sum = leftTerm + rightTerm
                if (sum > target) {
                    break nextStartTerm
                } else if (sum == target) {
                    guard let leftIndex = nums.index(of: leftTerm),
                        let rightIndex = nums.index(of: rightTerm) else {
                            return resultNoneFound
                    }
                    return [leftIndex, rightIndex].sorted(by: < )
                }
            }
        }
        
        return resultNoneFound
    }
}
