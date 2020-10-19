//
//  isSubtree.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//
/*
 给定两个非空二叉树 s 和 t，检验 s 中是否包含和 t 具有相同结构和节点值的子树。s 的一个子树包括 s 的一个节点和这个节点的所有子孙。s 也可以看做它自身的一棵子树。

 示例 1:
 给定的树 s:

      3
     / \
    4   5
   / \
  1   2
 给定的树 t：

    4
   / \
  1   2
 返回 true，因为 t 与 s 的一个子树拥有相同的结构和节点值。

 示例 2:
 给定的树 s：

      3
     / \
    4   5
   / \
  1   2
     /
    0
 给定的树 t：

    4
   / \
  1   2
 返回 false。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/subtree-of-another-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
extension Solution {
//class Solution_isSubtree {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        return true
    }
}
