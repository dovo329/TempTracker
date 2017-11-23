//
//  AddTwoNumbers.swift
//  TemperatureTracker
//
//  Created by Douglas Voss on 11/22/17.
//  Copyright © 2017 VossWareLLC. All rights reserved.
//
// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 0 -> 8

import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class AddTwoNumbers {
    
//   func convertListNodeToInt(_ node: ListNode) -> Int {
//
//        var accum = node.val
//        var mutNode = node
//        while let nextNode = mutNode.next {
//            accum *= 10
//            accum += nextNode.val
//            mutNode = nextNode
//        }
//        return accum
//    }
//
    func convertIntToListNode(_ num: Int) -> ListNode? {
        var resultNode = ListNode(0)
        var previousResultNode = resultNode
        let startResultNode = resultNode
        let numStr = String(num).characters.reversed()
        for char in numStr {
            if let intVal = Int(String(char)) {
                resultNode.val = intVal
                resultNode.next = ListNode(0)
                previousResultNode = resultNode
                resultNode = resultNode.next!
            } else {
                return nil
            }
        }
        previousResultNode.next = nil

        return startResultNode
    }
//
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        guard let l1 = l1, let l2 = l2 else {
//            return nil
//        }
//
//        let num1 = convertListNodeToInt(l1)
//        let num2 = convertListNodeToInt(l2)
//        let sum = num1 + num2
//        // need to make a linked list out of sum
//        return convertIntToListNode(sum)
//    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard let l1 = l1, let l2 = l2 else {
            return nil
        }
        
        var carry = 0
        var mutNode1: ListNode? = l1
        var mutNode2: ListNode? = l2
        var mutResultNode: ListNode?
        var prevResultNode: ListNode?
        var startResultNode: ListNode?
        while mutNode1 != nil || mutNode2 != nil || carry > 0 {
            
            let val1 = mutNode1?.val ?? 0
            let val2 = mutNode2?.val ?? 0
            
            let sum = val1 + val2
            
            if mutResultNode == nil {
                mutResultNode = ListNode(0)
                startResultNode = mutResultNode
            }
            mutResultNode?.val = (sum + carry) % 10
            mutResultNode?.next = ListNode(0)
            
            carry = (sum + carry) >= 10 ? 1 : 0
            
            mutNode1 = mutNode1?.next
            mutNode2 = mutNode2?.next
            prevResultNode = mutResultNode
            mutResultNode = mutResultNode?.next
        }
        prevResultNode?.next = nil
        return startResultNode
    }
}
