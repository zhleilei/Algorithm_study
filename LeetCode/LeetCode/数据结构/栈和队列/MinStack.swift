//
//  MinStack.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) —— 将元素 x 推入栈中。
 pop() —— 删除栈顶的元素。
 top() —— 获取栈顶元素。
 getMin() —— 检索栈中的最小元素。
  

 示例:

 输入：
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 输出：
 [null,null,null,null,-3,null,0,-2]

 解释：
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.
  

 提示：

 pop、top 和 getMin 操作总是在 非空栈 上调用。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/min-stack
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 思路: 通过链表的方式, 在链表中保存两个值 当前值和当前最小值.注意push的时候比较当前值和最小值.
 
 类似: https://leetcode-cn.com/problems/min-stack-lcci/
 */
class Node {
    var val: Int? = 0
    var min: Int? = 0
    var next: Node?
    init(val: Int, min: Int, next: Node?) {
        self.val = val
        self.min = min
        self.next = next
    }
}

class MinStack {

    /** initialize your data structure here. */
    var head: Node? = Node(val: 0, min: Int.max, next: nil) // 注意min: Int.max
    
    init() {

    }

    func push(_ x: Int) {
        head = Node(val: x, min: min(x, (head?.min)!), next: head)
    }

    func pop() {
        head = head?.next
    }

    func top() -> Int {
        return (head?.val)!
     }

    func getMin() -> Int {
        return (head?.min)!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
