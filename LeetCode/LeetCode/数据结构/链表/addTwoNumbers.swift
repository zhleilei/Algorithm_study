//
//  addTwoNumbers.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路: 通过虚拟头结点方式,设置进位表示记录进位,创建新的节点应该是两数之和再加上carry, 到最后判断是否有进位表示,有的话创建新的节点
 */
extension Solution {
//class Solution_addTwoNumbers {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        let dummyHead: ListNode = ListNode(0)
        var last: ListNode = dummyHead
        var carry: Int = 0
        var l1Node = l1
        var l2Node = l2
        while l1Node != nil || l2Node != nil {
            var v1 = 0
            if l1Node != nil {
                v1 = (l1Node?.val)!
                l1Node = l1Node?.next
            }
            var v2 = 0
            if l2Node != nil {
                v2 = (l2Node?.val)!
                l2Node = l2Node?.next
            }
            let sum = v1 + v2 + carry
            carry = sum / 10
            last.next = ListNode(sum % 10)
            last = last.next!
        }
        if carry > 0 {
            last.next = ListNode(carry)
        }
        return dummyHead.next
    }
}
