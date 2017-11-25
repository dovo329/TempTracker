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
        
        // got to the middle of both
        let N1 = nums1.count
        let N2 = nums2.count
        
        let N = N1 + N2
        
        if N == 0 {
            return 0.0
        }
        if N1 == 0 {
            return self.findMedianSortedArrays(nums2, nums2)
        }
        if N2 == 0 {
            return self.findMedianSortedArrays(nums1, nums1)
        }
        
        var medianIndex = N / 2
        if N1 % 2 == 0 && N2 % 2 == 0 {
            medianIndex -= 1
        }
        
        var i1Interval = Int(N1/4)
        //var i2Interval = Int(N2/4)
        var i1 = Int(N1 / 2)
        var i2 = Int(N2 / 2)
        
        if N1 % 2 == 0 {
            i1 -= 1
        }
        if N2 % 2 == 0 {
            i2 -= 1
        }
        
        // compare the numbers
        // lets choose to move i1 around instead of i2
        // we need to move it around until we have a match
        repeat {
            print("nums1[\(i1)]=\(nums1[i1]) nums2[\(i2)]=\(nums2[i2])")
            print("i1Interval=\(i1Interval)")
            if (nums1[i1] == nums2[i2]) {
                break;
            } else if (nums1[i1] < nums2[i2]) {
                i1 = i1 + i1Interval
                i1Interval /= 2
            } else {
                i1 = i1 - i1Interval
                i1Interval /= 2
            }
        } while i1Interval > 0
        
        // now i1 and i2 are where nums1 and nums2 meet
        // now we just have to go up or down to the median index, interleaving as we go
        // to find the median value/s
        
        if i1+i2 < medianIndex {
            while i1+i2 < medianIndex {
                if (nums1[i1] < nums2[i2]) {
                    i1 += 1
                } else {
                    i2 += 1
                }
            }
        } else if i1+i2 > medianIndex {
            while i1+i2 > medianIndex {
                if (nums1[i1] >= nums2[i2]) {
                    i1 -= 1
                } else {
                    i2 -= 1
                }
            }
        }
        // now i1 or i2 should be at the medianIndex
        // and we can get the median values
        print("medianIndex=\(medianIndex) median i1=\(i1) i2=\(i2)")
        
        //let nums = mergeSortedArrs(nums1, nums2)
        //printArr(nums)
        //print("nums1[\(i1)]=\(nums1[i1]) nums2[\(i2)]=\(nums2[i2])")
        
        i1 = min(N1-1, i1)
        i2 = min(N2-1, i2)
        
        if N % 2 == 1 { // odd case
            return Double(min(nums1[i1], nums2[i2]))
        } else { // even case
            return Double(nums1[i1] + nums2[i2]) / 2.0
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
