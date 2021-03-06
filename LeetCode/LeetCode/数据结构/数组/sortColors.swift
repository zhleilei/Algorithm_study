//
//  sortColors.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

 注意:
 不能使用代码库中的排序函数来解决这道题。

 示例:

 输入: [2,0,2,1,1,0]
 输出: [0,0,1,1,2,2]
 进阶：

 一个直观的解决方案是使用计数排序的两趟扫描算法。
 首先，迭代计算出0、1 和 2 元素的个数，然后按照0、1、2的排序，重写当前数组。
 你能想出一个仅使用常数空间的一趟扫描算法吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-colors
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
 使用三指针
 左指针A
 右指针B
 中间指针C
 
判断C
 遇到1,C++
 遇到0,LC交换, C++, L++
 遇到2,RC交换, C++, R-- 在此判断C情况
 */
extension Solution {
//class Solution_sortColors {
    func sortColors(_ nums: inout [Int]) {
        var cur = 0
        var left = 0
        var right = nums.count - 1
        while cur <= right {
            let value = nums[cur]
            if value == 0 {
                swap(&nums, i: left, j: cur)
                left += 1
                cur += 1
            }else if value == 1 {
                cur += 1
            }else {
                swap(&nums, i: cur, j: right)
                right -= 1
            }
        }
    }
    
    func swap(_ num: inout [Int], i: Int, j: Int) {
        let temp = num[i]
        num[i] = num[j]
        num[j] = temp
    }
}
