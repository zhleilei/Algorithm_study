//
//  File.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

  

 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
    暴力法  双层遍历
    通过哈希表 通过空间换时间
    
 */
extension Solution {
//class Solution_twosum {
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        // 双层遍历
        for (i, num) in nums.enumerated() {
            for index in (i + 1 ..< nums.count) {
                if target - num == nums[index] {
                    print([i, index])
                    return [i, index]
                }
            }
        }
        return []
    }
    // 遍历哈希表
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 用来存储扫描过的元素
        var dict = [Int:Int]()
        for (index, n) in nums.enumerated() {
            let complement = target - n
            if dict.keys.contains(complement) && index != dict[complement] {
//                print([dict[complement]!, index])
                return [dict[complement]!, index]
            }
            dict[n] = index
        }
        return []
    }
}

func twosum() {
    let nums = [2, 7, 11, 15], target = 18
    let _ = Solution.init().twoSum(nums, target)
}

