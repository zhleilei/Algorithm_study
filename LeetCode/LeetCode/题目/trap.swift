//
//  trap.swift
//  LeetCode
//
//  Created by zll on 2021/1/23.
//  Copyright © 2021 zll. All rights reserved.
//

/*
    给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

     

    示例 1：



    输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
    输出：6
    解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
    示例 2：

    输入：height = [4,2,0,3,2,5]
    输出：9
     

    提示：

    n == height.length
    0 <= n <= 3 * 104
    0 <= height[i] <= 105

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/trapping-rain-water
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
    当前柱子上能放的水取决于 min(leftMax, rightMax)
 */

extension Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        let lastIndex = height.count - 1
        // 提前创建好非空数组
        var leftMaxes = Array(repeating: 0, count: height.count)
        for index in 1 ..< lastIndex {
            leftMaxes[index] = max(leftMaxes[index - 1], height[index - 1])
        }
        // 提前创建好非空数组
        var rightMaxes = Array(repeating: 0, count: height.count)
        for index in (0 ..< lastIndex).reversed() {
            rightMaxes[index] = max(rightMaxes[index + 1], height[index + 1])
        }
        
        var water = 0
        for index in 1 ..< lastIndex  {
            let mi = min(leftMaxes[index], rightMaxes[index])
            if mi <= height[index] {
                continue
            }
            water += mi - height[index]
        }
        return water
    }
}
