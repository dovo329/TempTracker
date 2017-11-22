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
        let resultNoneFound = [0, 0]
        
        var numIndexDict = [Int: Int]()
        
        for i in 0..<nums.count {
            let complement = target - nums[i]
            if let complementIndex = numIndexDict[complement] {
                if (complementIndex != i) {
                    return [complementIndex, i]
                }
            }
            numIndexDict[nums[i]] = i
        }
        
        return resultNoneFound
        
        // brute force way
//        nextStartTerm: for startIndex in 0..<nums.count-1 {
//            for secondIndex in startIndex+1..<nums.count {
//                let leftTerm = nums[startIndex]
//                let rightTerm = nums[secondIndex]
//                let sum = leftTerm + rightTerm
//                if (sum == target) {
//                    return [startIndex, secondIndex]
//                }
//            }
//        }
    }
}
