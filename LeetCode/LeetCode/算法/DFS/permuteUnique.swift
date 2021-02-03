//
//  permuteUnique.swift
//  LeetCode
//
//  Created by zll on 2021/1/27.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。

  

 示例 1：

 输入：nums = [1,1,2]
 输出：
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 示例 2：

 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  

 提示：

 1 <= nums.length <= 8
 -10 <= nums[i] <= 10


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
 
 */

class SolutionBB {
    
    var nums: [Int]?
    var res = [[Int]]()
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {
            return []
        }
        self.nums = nums
        dfs(0)
        return res
    }
    
//    func dfs(_ idx: Int) {
//        if idx == nums!.count {
//            var list = [Int]()
//            for (_, val) in nums!.enumerated() {
//                list.append(val)
//            }
//            if !res.contains(list) {
//                res.append(list)
//            }
//        }else {
//            for i in idx ..< nums!.count {
//                swap(idx, i)
//                dfs(idx + 1)
//                swap(idx, i)
//            }
//        }
//    }
    
    func dfs(_ idx: Int) {
        if idx == nums!.count {
            var list = [Int]()
            for (_, val) in nums!.enumerated() {
                list.append(val)
            }
            res.append(list)
        }else {
            for i in idx ..< nums!.count {
                if isRepeat(idx, i) {
                    continue
                }
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
    
    // 优化: 判断前面是否有重复的了
    func isRepeat(_ idx: Int, _ i: Int) -> Bool{
        for j in idx ..< i  {
            if nums![j] == nums![i] {
                return true
            }
        }
        return false
    }
}
