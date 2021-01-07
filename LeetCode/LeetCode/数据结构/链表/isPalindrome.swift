//
//  isPalindrome.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 请判断一个链表是否为回文链表。

 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
 
思路:
 方法一:翻转链表,然后遍历两个链表,对比.
 方法二:修改链表指针,翻转右边的链表,然后前后遍历链表判断左右是否相等.(用到获取中间节点和翻转链表方法), 考虑边界条件.
 方法三:不破坏原来链表的结构.
 
 翻转链表.
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 类似: https://leetcode-cn.com/problems/palindrome-linked-list-lcci/
 
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
extension Solution {
//class Solution_isPalindrome {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return true
        }
        if head?.next?.next == nil {
            return head?.val == head?.next?.val
        }
        
        let mid: ListNode = middelNode(head)
        var rHead: ListNode? = reverseList(mid.next)
        var lHead: ListNode? = head
        
        while rHead != nil {
            if rHead?.val != lHead?.val {
                return false
            }
            rHead = rHead?.next
            lHead = lHead?.next
        }
        
        return true
    }
    // 通过快慢指针.满指针走一步, 快指针走两步.
    func middelNode(_ head: ListNode?) -> ListNode {
        var slow: ListNode? = head
        var fast: ListNode? = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow!
    }
    
    func reverseList(_ head: ListNode?) -> ListNode {
        var tempH: ListNode? = head
        var newHead: ListNode? = nil
        while tempH != nil {
            let temp: ListNode? = tempH?.next
            tempH?.next = newHead
            newHead = tempH
            tempH = temp
        }
        return newHead!
    }
}
