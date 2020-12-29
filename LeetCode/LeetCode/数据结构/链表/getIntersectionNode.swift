//
//  getIntersectionNode.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 160:
 编写一个程序，找到两个单链表相交的起始节点。
 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
 输出：Reference of the node with value = 8
 输入解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,0,1,8,4,5]。在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/intersection-of-two-linked-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路: 通过两个链表头尾相接, 同时扫描两个链表, 如果有最后相等的值,那么这个就是交点
 
 类似题目:
 https://leetcode-cn.com/problems/intersection-of-two-linked-lists-lcci/
 
 https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/
 */
extension Solution {
//class Solution_getIntersectionNode {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var curA = headA
        var curB = headB
        
        while curA !== curB {
            curA = (curA == nil) ? headB : curA?.next
            curB = (curB == nil) ? headA : curB?.next
        }
        return curA
    }
}

//extension ListNode: Hashable, Equatable {
//    public func hash(into hasher: inout Hasher) {
//        // 用于唯一标识
//        hasher.combine(val)
//        hasher.combine(ObjectIdentifier(self))
//    }
//
//    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
//        return lhs === rhs
//    }
// }
