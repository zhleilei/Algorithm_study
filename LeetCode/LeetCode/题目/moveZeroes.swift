//
//  moveZeroes.swift
//  LeetCode
//
//  Created by zll on 2021/1/22.
//  Copyright © 2021 zll. All rights reserved.
//
/*
 
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/move-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:使用双指针
 
 */

extension Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count == 0 {
            return
        }
        var cur: Int = 0
        for index in 0 ..< nums.count {
            if nums[index] == 0 {
                continue
            }
            if cur != index {
                // 交换&置0
                nums[cur] = nums[index]
                nums[index] = 0
            }
            cur += 1
        }
    }
}
