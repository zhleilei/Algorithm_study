//
//  LRUCache.swift
//  LeetCode
//
//  Created by zll on 2021/1/23.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制 。
 实现 LRUCache 类：

 LRUCache(int capacity) 以正整数作为容量 capacity 初始化 LRU 缓存
 int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
 void put(int key, int value) 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字-值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
  

 进阶：你是否可以在 O(1) 时间复杂度内完成这两种操作？

  

 示例：

 输入
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 输出
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 解释
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // 缓存是 {1=1}
 lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
 lRUCache.get(1);    // 返回 1
 lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 lRUCache.get(2);    // 返回 -1 (未找到)
 lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 lRUCache.get(1);    // 返回 -1 (未找到)
 lRUCache.get(3);    // 返回 3
 lRUCache.get(4);    // 返回 4
  

 提示：

 1 <= capacity <= 3000
 0 <= key <= 3000
 0 <= value <= 104
 最多调用 3 * 104 次 get 和 put

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
    哈希表 + 双向链表
 
    虚拟头结点,尾结点
 */

class CustomListNode {
    var next: CustomListNode?
    var pre: CustomListNode?
    var val: Int
    var key: Int
    init(_ val: Int, _ key: Int) {
        self.val = val
        self.key = key
    }
}

class LRUCache {
    var head = CustomListNode(0, 0)
    var tail = CustomListNode(0, 0)
    
    var dict = [Int: CustomListNode]()
    var capacity = 0
    var count = 0
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            removeNode(node)
            addToFirst(node)
            return node.val
        }else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.val = value
            removeNode(node)
            addToFirst(node)
        }else {
            if count == capacity {
                removeLastNode()
            }else {
                count += 1
            }
            let node = CustomListNode(value, key)
            addToFirst(node)
        }
    }
    
    func removeNode(_ node: CustomListNode) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
        dict[node.key] = nil
    }
    
    func removeLastNode() {
        if count > 0 {
            let tempNode = tail.pre
            tempNode?.pre?.next = tail
            tail.pre = tempNode?.pre
            dict[tempNode!.key] = nil;
        }
    }
    
    func addToFirst(_ node: CustomListNode) {
        node.next = head.next
        head.next?.pre = node
        
        head.next = node
        node.pre = head
        dict[node.key] = node
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
