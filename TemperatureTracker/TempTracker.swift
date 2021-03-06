//
//  TemperatureTracker.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/21/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//

import Foundation

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
    
    enum TempTrackerError: Int, CustomNSError, LocalizedError {
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
        
        var failureReason: String {
            switch self {
            case .NoTemperatures:
                return NSLocalizedString("No temperatures are present in the current temperature array", comment: "TempTrackerError Failure Reason")
            case .NoMode:
                return NSLocalizedString("No repeating temperature value found in current temperatures array", comment: "TempTrackerError Failure Reason")
            }
        }

        var helpAnchor: String {
            switch self {
            case .NoTemperatures:
                return NSLocalizedString("No temperatures are present in the current temperature array", comment: "TempTrackerError Help Anchor")
            case .NoMode:
                return NSLocalizedString("No repeating temperature value found in current temperatures array", comment: "TempTrackerError Help Anchor")
            }
        }
        
        var recoverySuggestion: String {
            switch self {
            case .NoTemperatures:
                return NSLocalizedString("Add some temperatures to the temperature array via the insert method", comment: "TempTrackerError Recovery Suggestion")
            case .NoMode:
                return NSLocalizedString("Add some temperatures that are the same as one of the previously added temperatures", comment: "TempTrackerError Recovery Suggestion")
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
        var maxValue = Int.min
        var modeFound = false
        findMode: for temperature in temperatures {
            countDict[temperature] = (countDict[temperature] ?? 0) + 1
            maxValue = max(temperature, maxValue)
            if countDict[temperature]! > 1 {
                modeFound = true
                break findMode
            }
        }
        if countDict.count == 0 || !modeFound {
            throw TempTrackerError.NoMode
        }
        return maxValue
    }
}
