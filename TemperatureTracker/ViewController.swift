//
//  ViewController.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/21/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //testTempTracker()
        //testTwoSumResult()
        //testAddTwoNumbers()
        //testLongestSubstring()
        //testFindMedianSortedArrays()
        testLongestPalindromicSubstring()
    }
    
    func testLongestPalindromicSubstring() {
        let dut = LongestPalindromicSubstring()
        
        //let str = "a"
        //let str = "bb"
        //let str = "abcba"
        //let str = "aba"
        //let str = "babad"
        //let str = "cptobviouswasitaratisawxyzevacanistabbatsinacavemongodb"
        //let str = "abcda"
        //let str = "abcdasdfghjkldcba"
        let str = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
        
        print("longest palindromic stubstring of \(str) is \(dut.longestPalindrome(str))")
    }
    
    func testFindMedianSortedArrays() {
        let dut = FindMedianSortedArrays()
        
        var num1, num2 : [Int]
            
//        num1 = [1, 3, 8, 9, 22, 47, 48, 49, 89]
//        num2 = [2, 4, 6, 8, 19, 29, 49]
        
//        num1 = [1, 3]
//        num2 = [2]

//        num1 = [1, 3]
//        num2 = [2, 4]
        
//        num1 = []
//        num2 = [1]
        
        num1 = []
        num2 = [2, 3]
        
        print("median of")
        dut.printArr(num1)
        print("and")
        dut.printArr(num2)
        print("is \(dut.findMedianSortedArrays(num1, num2))")
    }
    
    func testLongestSubstring() {
        
        let dut = LongestSubstring()
        var testStr = ""
        
//        testStr = "abcabcbb"
//        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
//
//        testStr = "bbbbb"
//        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
//
//        testStr = "pwwkew"
//        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
//
//        testStr = "c"
//        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
//
//        testStr = "aab"
//        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
//        
//        testStr = "dvdf"
//        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
//        
//        testStr = "anviaj"
//        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
//        
//        testStr = ""
//        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
        
        testStr = "abba"
        print("longest substring length of \(testStr) is \(dut.lengthOfLongestSubstring(testStr))")
    }
    
    func testAddTwoNumbers() {
//        let listNode1 = AddTwoNumbers.convertIntToListNode(4)
//        let listNode2 = AddTwoNumbers.convertIntToListNode(5)
        
        let addTwoNumbers = AddTwoNumbers()
//        let listNode1 = addTwoNumbers.convertIntToListNode(243)
//        let listNode2 = addTwoNumbers.convertIntToListNode(564)
        
//        let listNode1 = addTwoNumbers.convertIntToListNode(5)
//        let listNode2 = addTwoNumbers.convertIntToListNode(5)
        
        let listNode1 = addTwoNumbers.convertIntToListNode(1)
        let listNode2 = addTwoNumbers.convertIntToListNode(99)
        
        if let resultListNode = addTwoNumbers.addTwoNumbers(listNode1, listNode2) {
            print("success")
        } else {
            print("failed")
        }
        
    }
    
    func testTwoSumResult() {
        //let twoSumResult = TwoSum.twoSum([11, 7, 15, 2], 18)
        //let twoSumResult = TwoSum.twoSum([3, 2, 4], 6)
        let twoSumResult = TwoSum.twoSum([3, 3], 6)
        print("twoSumResult: \(twoSumResult)")
    }
    
    func testTempTracker() {
        
        let tempTracker = TempTracker(temperatures: [5, 4, 2, 1, 5, 3])
        tempTracker.insert(temperature: 100)
        
        do {
            let max = try tempTracker.getMax()
            print("max: \(max)")
        } catch {
            print("Error getting max: \(error.localizedDescription)")
        }
        
        do {
            let min = try tempTracker.getMin()
            print("min: \(min)")
        } catch {
            print("Error getting min: \(error.localizedDescription)")
        }
        
        do {
            let mean = try tempTracker.getMean()
            print("mean: \(mean)")
        } catch {
            print("Error getting mean: \(error.localizedDescription)")
        }
        
        do {
            let mode = try tempTracker.getMode()
            print("mode: \(mode)")
        } catch {
            print("Error getting mode: \(error.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

