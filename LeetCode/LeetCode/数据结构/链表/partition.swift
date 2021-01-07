//
//  partition.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 分割链表
    给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

    你应当保留两个分区中每个节点的初始相对位置。

     

    示例:

    输入: head = 1->4->3->2->5->2, x = 3
    输出: 1->2->2->4->3->5

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/partition-list
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:创建两个虚拟头节点, 跟x比较(遍历链表 head = head.next),
 
 
 类似: https://leetcode-cn.com/problems/partition-list-lcci/
 */
extension Solution {
//class Solution_partition {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let lHead: ListNode = ListNode(0)
        var lTail: ListNode = lHead
        let rHead: ListNode = ListNode(0)
        var rTail: ListNode = rHead
        var tempH: ListNode? = head
        while tempH != nil {
            if (tempH?.val)! < x {
                lTail.next = tempH
                lTail = tempH!
            }else {
                rTail.next = tempH
                rTail = tempH!
            }
            tempH = tempH?.next // 遍历列表
        }
        
        rTail.next = nil  // 不可缺少
        lTail.next = rHead.next // 将两个链表连接起来
        
        return lHead.next
    }
}
