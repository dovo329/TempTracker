//
//  TemperatureTracker.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/21/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//

import Foundation

//: Playground - noun: a place where people can play

import Foundation
import UIKit

//var str = "Hello, playground"
//You decide to test if your oddly-mathematical heating company is fulfilling its All-Time Max, Min, Mean and Mode Temperature Guarantee™.
//Write a class TempTracker with these methods:
//
//insert()—records a new temperature
//getMax()—returns the highest temp we've seen so far
//getMin()—returns the lowest temp we've seen so far
//getMean()—returns the mean ↴ of all temps we've seen so far
//getMode()—returns a mode ↴ of all temps we've seen so far
//Optimize for space and time. Favor speeding up the getter methods getMax(), getMin(), getMean(), and getMode() over speeding up the insert() method.
//
//getMean() should return a double, but the rest of the getter methods can return integers. Temperatures will all be inserted as integers. We'll record our temperatures in Fahrenheit, so we can assume they'll all be in the range 0..1100..110.
//
//If there is more than one mode, return any of the modes.

class TempTracker {
    
    private var temperatures = [Int]()
    
    public enum TempTrackerError: Int, CustomNSError, LocalizedError {
        case NoTemperatures = 0
        case NoMode
        
        var errorDescription: String {
            switch self {
            case .NoTemperatures:
                return NSLocalizedString("No temperatures are present", comment: "TempTrackerError Description")
            case .NoMode:
                return NSLocalizedString("Mode does not exist", comment: "TempTrackerError Description")
            }
        }
        
        var errorDomain: String {
            return String(describing: TempTrackerError.self)
        }
        
        var errorCode: Int {
            return self.rawValue
        }
        
        var errorUserInfo: [String : Any] {
            return [NSLocalizedDescriptionKey: self.errorDescription]
        }
    }
    
    func insert(temperature: Int) -> Void {
        temperatures.append(temperature)
        temperatures.sort { $0 < $1 }
    }
    
    convenience init(temperatures: [Int]) {
        self.init()
        self.temperatures = temperatures.sorted(by: < )
    }
    
    func getMax() throws -> Int {
        if let maxTemp = temperatures.last {
            return maxTemp
        }
        throw TempTrackerError.NoTemperatures
    }
    
    func getMin() throws -> Int {
        if let minTemp = temperatures.first {
            return minTemp
        }
        throw TempTrackerError.NoTemperatures
    }
    
    func getMean() throws -> Double {
        if temperatures.count == 0 {
            throw TempTrackerError.NoTemperatures
        }
        return temperatures.reduce(0.0, { (accum, nextTemperature) -> Double in
            return accum + Double(nextTemperature)
        }) / Double(temperatures.count)
    }
    
    func getMode() throws -> Int {
        if temperatures.count == 0 {
            throw TempTrackerError.NoTemperatures
        }
        var countDict = [Int: Int]()
        for temperature in temperatures {
            if countDict[temperature] == nil {
                countDict[temperature] = 0
            }
            countDict[temperature]! += 1
        }
        if countDict.count == 0 {
            throw TempTrackerError.NoMode
        }
        
        // func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, (key: Key, value: Value)) throws -> Result) rethrows -> Result
        
        var maxKey : Int?
        let maxValue = countDict.reduce(0, { (accum: Int, nextTuple: (key: Int, value: Int)) -> Int in
            if (nextTuple.value > accum) {
                maxKey = nextTuple.key
            }
            return max(accum, nextTuple.value)
        })
        
        if let maxKey = maxKey {
            if let maxCount = countDict[maxKey] {
                if (maxCount > 1) {
                    return maxKey
                } else {
                    throw TempTrackerError.NoMode
                }
            } else {
                throw TempTrackerError.NoMode
            }
            
        } else {
            throw TempTrackerError.NoMode
        }
    }
}

//class TempTracker {
//
//    var temperatures = [Double]()
//
//    func insert(temperature: Double) -> Void {
//        temperatures.append(temperature)
//    }
//
//    func getMax() -> Double {
//        if let max = temperatures.max() {
//            return max
//        } else {
//            return 0.0
//        }
//    }
//
//    func getMin() -> Double {
//        if let min = temperatures.min() {
//            return min
//        } else {
//            return 0.0
//        }
//    }
//
//    func getMean() -> Double {
//        return temperatures.reduce(0.0, { (accum, nextTemperature) -> Double in
//            return accum + nextTemperature
//        }) / Double(temperatures.count)
//    }
//
//    func getMode() -> Double {
//        if temperatures.count == 0 {
//            return 0.0
//        }
//        let sortedTemperatures = temperatures.sorted()
//        return sortedTemperatures[temperatures.count/2]
//    }
//}
//
//var tempTracker = TempTracker()
//tempTracker.temperatures = [1.0, 2.0, 3.0, 2.5, 1.5, 4.0]
//
//print("max: \(tempTracker.getMax())")
//print("min: \(tempTracker.getMin())")
//print("mean: \(tempTracker.getMean())")
//print("mode: \(tempTracker.getMode())")
