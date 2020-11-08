//
//  merge.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//


/*
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

  

 说明：

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
  

 示例：

 输入：
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 输出：[1,2,2,3,5,6]
  

 提示：

 -10^9 <= nums1[i], nums2[i] <= 10^9
 nums1.length == m + n
 nums2.length == n

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 思路: 比较的最大的值放在最后面.这里遍历的是合并数组nums2
extension Solution {
//class Solution_merge {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var currentIndex = m + n - 1
        var i = m - 1
        var j = n - 1
        // 执行一次循环
        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[currentIndex] = nums1[i]
                currentIndex = currentIndex - 1
                i = i - 1 // 当前值使用后 i-1
            }else {
                nums1[currentIndex] = nums2[j]
                currentIndex = currentIndex - 1
                j = j - 1 // 当前值使用后 j-1
            }
        }
        
    }
}
