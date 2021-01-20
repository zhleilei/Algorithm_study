//
//  largestBSTSubtree.swift
//  LeetCode
//
//  Created by zll on 2021/1/14.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 给定一个二叉树, 找出其中最大的二叉搜索树子树.
 子树必须包含其所有的后代
 
 从根节点判断最大BST, 递归查找左右节点
 
 O(n)时间复杂解决?
 
 
 */



//extension Solution {
//    func largestBSTSubtree(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//        if isBST(root) {
//            return nodeCount(root)
//        }
//        return max(largestBSTSubtree(root?.left), largestBSTSubtree(root?.right))
//    }
//
//    func isBST(_ root: TreeNode?) -> Bool {
//
//        return false
//    }
//
//    func nodeCount(_ root: TreeNode?) -> Int {
//        return 0
//    }
//}

extension Solution {
    func largestBSTSubtree(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : getInfo(root)!.size
    }
    
    func getInfo(_ root: TreeNode?) -> Info? {
        if root == nil {
            return nil
        }
        let li = getInfo(root?.left)
        let ri = getInfo(root?.right)
        
        var leftBstSize = -1, rightBstSize = -1, max = root?.val, min = root?.val
        if li == nil {
            leftBstSize = 0
        }else if (li?.root === root?.left && root!.val > li!.max) {
            leftBstSize = li!.size
            min = li?.min
        }
        
        if ri == nil {
            rightBstSize = 0
        }else if (ri?.root === root?.right && root!.val > ri!.min) {
            rightBstSize = ri!.size
            max = ri?.max
        }
        
        if leftBstSize >= 0 && rightBstSize >= 0 {
            return Info.init(root, 1 + leftBstSize + rightBstSize, max!, min!)
        }
        
        if li != nil && ri != nil {
            return (li!.size > ri!.size) ? li : ri
        }
        return li != nil ? li : ri
    }
    
    class Info {
        var root: TreeNode?
        var size: Int
        var max: Int
        var min: Int
        
        init(_ root: TreeNode?, _ size: Int , _ max: Int, _ min: Int) {
            self.root = root
            self.size = size
            self.max = max
            self.min = min
        }
    }
}
