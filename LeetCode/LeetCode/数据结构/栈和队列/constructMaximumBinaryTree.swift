//
//  constructMaximumBinaryTree.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给定一个不含重复元素的整数数组。一个以此数组构建的最大二叉树定义如下：

 二叉树的根是数组中的最大元素。
 左子树是通过数组中最大值左边部分构造出的最大二叉树。
 右子树是通过数组中最大值右边部分构造出的最大二叉树。
 通过给定的数组构建最大二叉树，并且输出这个树的根节点。

  

 示例 ：

 输入：[3,2,1,6,0,5]
 输出：返回下面这棵树的根节点：

       6
     /   \
    3     5
     \    /
      2  0
        \
         1
  

 提示：

 给定的数组的大小在 [1, 1000] 之间。
 
 思路:
    找出[l, r) 范围内的最大值  (给定数组和边界找到最大值就是根节点)
    分别对左右节点调用寻找根节点的方法
    

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

extension Solution {
//class Solution_constructMaximumBinaryTree {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        return findRoot(nums, 0, nums.count)
    }
    
    func findRoot(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode?{
        if l == r {
            return nil
        }
        
        // 找出[l, r) 范围内的最大值
        var maxIndex = l
        for index in l + 1 ..< r {
            if nums[index] > nums[maxIndex] {
                maxIndex = index
            }
        }
        
        let root = TreeNode.init(nums[maxIndex])
        root.left = findRoot(nums, l, maxIndex)
        root.right = findRoot(nums, maxIndex + 1, r)
        return root
    }
}


#warning("zll 变种题目, 找到父节点索引数组")

// 找父节点, 找左右大的节点, 小的那个就是父节点. 使用栈来实现.
// 栈是单调递减的.  通过压栈可以确定左边,右边第一个比它大的数.(各个节点的数值是不相等的)

// 1.push 的时候  2.pop的时候

// 创建两个数组, 比较对应索引对应的值, 分多钟情况判断父节点. 五种情况.
