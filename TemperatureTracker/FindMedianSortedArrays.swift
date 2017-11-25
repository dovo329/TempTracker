//
//  FindMedianSortedArrays.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/24/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//

import Foundation

class FindMedianSortedArrays {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let nums = mergeSortedArrs(nums1, nums2)
        //printArr(nums)
        //print("nums1[\(i1)]=\(nums1[i1]) nums2[\(i2)]=\(nums2[i2])")

        let N = nums.count
        let medianIndex = N / 2
        
        if N % 2 == 1 { // odd case
            return Double(nums[medianIndex])
        } else { // even case
            return Double(nums[medianIndex-1] + nums[medianIndex])/2
        }
        
    }
    
    func printArr(_ nums: [Int]) -> Void {
        
        print("nums = [", terminator: "")
        for i in 0..<nums.count {
            if (i == nums.count - 1) {
                print("\(i): \(nums[i])", terminator: "")
            } else {
                print("\(i): \(nums[i]), ", terminator: "")
            }
        }
        print("]")
    }
    
    private func mergeSortedArrs(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums = [Int]()
        var i1 = 0
        var i2 = 0
        let N1 = nums1.count
        let N2 = nums2.count
        let N = N1 + N2
        while (i1+i2 < N) {
            if (i1 >= N1) {
                nums.append(nums2[i2])
                i2 += 1
            } else if (i2 >= N2) {
                nums.append(nums1[i1])
                i1 += 1
            } else {
                if (nums1[i1] <= nums2[i2]) {
                    nums.append(nums1[i1])
                    i1 += 1
                } else {
                    nums.append(nums2[i2])
                    i2 += 1
                }
            }
        }
        
        return nums
    }
}
