//
//  subSort.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为[m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。

 示例：

 输入： [1,2,4,7,10,11,7,12,6,7,16,18,19]
 输出： [3,9]
 提示：

 0 <= len(array) <= 1000000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sub-sort-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
// 使用双指针法 从左到右, 从右到左分别遍历找出各自不满足条件的right 和 left
extension Solution {
//class Solution_subSort {
    func subSort(_ array: [Int]) -> [Int] {
        if array.count == 0 {
            return [-1, -1]
        }
        var max = array[0]
        var right = -1
        var left = -1
        
        for i in 1 ..< array.count {
            if array[i] > max {
                max = array[i]
            }else {
                right = i
            }
        }
        
        var min = array[array.count - 1]
        for i in (0 ..< array.count - 1).reversed()  {
            if array[i] < min {
                min = array[i]
            }else {
                left = i
            }
        }
        return [left, right]
    }
}
