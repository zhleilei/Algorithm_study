//
//  hasCycle.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*

 给定一个链表，判断链表中是否有环。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

 如果链表中存在环，则返回 true 。 否则，返回 false 。

  

 进阶：

 你能用 O(1)（即，常量）内存解决此问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/linked-list-cycle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

  

 示例 1：



 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 ==========
 
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意，pos 仅仅是用于标识环的情况，并不会作为参数传递到函数中。

 说明：不允许修改给定的链表。

 进阶：

 你是否可以使用 O(1) 空间解决此题？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/linked-list-cycle-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
extension Solution {
//class Solution_hasCycle {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        
        while slow != nil && fast != nil {
            if slow === fast { return true }
            slow = slow?.next
            fast = fast?.next?.next
        }

        return false
    }
    
    // 当遇到以及存储过的节点的时候，那么它就是第一个重复节点，也就是环形链表的入口
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var hashMap = Set<ListNode>()
        var pre = head
        
        while pre != nil {
            if !hashMap.insert(pre!).inserted {
                return pre
            }
            pre = pre?.next
        }
        return nil
    }
}


extension ListNode: Hashable, Equatable {
   public func hash(into hasher: inout Hasher) {
     // 用于唯一标识
     hasher.combine(val)
     hasher.combine(ObjectIdentifier(self))
   }
   public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
     return lhs === rhs
   }
}
