//
//  removeElements.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 删除链表中等于给定值 val 的所有节点。

 示例:

 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
 
 
 移除链表中所有给定val值的节点
 
 */
extension Solution {
//class Solution_removeElements {
//    func removeElements(_ head: inout ListNode?, _ val: Int) -> ListNode? {   // inout
//        var newHead: ListNode? = nil
//        var newTail: ListNode? = nil
//        while head != nil {
//            if head?.val != val { // 将newH拼接到newTail尾部
//                if newTail == nil {
//                    newHead = head
//                    newTail = head
//                }else {
//                    newTail?.next = head
//                    newTail = head
//                }
//            }
//            head = head?.next
//        }
//        return newHead
//    }
    
    class Solution {
        func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
            var curNode = head
            let dummyHead = ListNode(0)
            var dummyTrail = dummyHead

            while curNode != nil {

                if curNode!.val != val {
                    dummyTrail.next = curNode
                    dummyTrail = curNode!
                }
                curNode = curNode!.next
            }
            dummyTrail.next = nil

            return dummyHead.next
        }
    }
}
