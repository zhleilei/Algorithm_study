//
//  permute.swift
//  LeetCode
//
//  Created by zll on 2021/1/16.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 思路:
    通过used标记是否用过了
 题目:
    路径的总和2
 
    
 */
//Extensions must not contain stored properties
// 全排列
class SolutionAA {
    // 方式一
//    func permute(_ nums: [Int]) -> [[Int]] {
//        guard nums.count > 0 else {
//            return []
//        }
//        var res = [[Int]]()
//        var list = [Int]()
//        var used = Array(repeating: false, count: nums.count)
//        dfs(0, nums, &list, &res, &used)
//        return res
//    }

//    func dfs(_ idx: Int, _ nums: [Int], _ list: inout [Int], _ res: inout [[Int]], _ used: inout [Bool]) {
//        if idx == nums.count {
//            res.append(list)
//        }else {
//            for i in 0 ..< nums.count {
//                if used[i] {continue}
//                used[i] = true
//                list.append(nums[i])
//                dfs(idx + 1, nums, &list, &res, &used)
//                used[i] = false
//                list.removeLast()
//            }
//        }
//    }
    // 方式二
//    func permute(_ nums: [Int]) -> [[Int]] {
//        guard nums.count > 0 else {
//            return []
//        }
//        var res = [[Int]]()
//        var list = [Int]()
//        dfs(0, nums, &list, &res)
//        return res
//    }
//
//    func dfs(_ idx: Int, _ nums: [Int], _ list: inout [Int], _ res: inout [[Int]]) {
//        if idx == nums.count {
//            res.append(list)
//        }else {
//            for i in 0 ..< nums.count {
//                if list.contains(nums[i]) { continue }
//                list.append(nums[i])
//                dfs(idx + 1, nums, &list, &res)
//                list.remove(at: list.count - 1)
//            }
//        }
//    }
    // 方式三(优化) 查询前面是否有 下一层不会使用上一层使用过的值
    var nums: [Int]?
    var res = [[Int]]()
    
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return []
        }
        self.nums = nums
        dfs(0)
        return res
    }
    
    func dfs(_ idx: Int) {
        if idx == nums!.count {
            var list = [Int]()
            for (_, val) in nums!.enumerated() {
                list.append(val)
            }
            res.append(list)
        }else {
            for i in idx ..< nums!.count {
                swap(idx, i)
                dfs(idx + 1)
                swap(idx, i)
            }
        }
    }
    
    func swap(_ i: Int, _ j: Int) {
        let temp = nums![i]
        nums![i] = nums![j]
        nums![j] = temp
    }
    
    
}
