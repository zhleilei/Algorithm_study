//
//  maxValue.swift
//  LeetCode
//
//  Created by zll on 2021/1/10.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？

  

 示例 1:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 12
 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
  

 提示：

 0 < grid.length <= 200
 0 < grid[0].length <= 200

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
 构建二维数组
 计算0行 0列,
 状态转移方程
 dp[row][col] = max(dp[row - 1][col], dp[row][col - 1]) + grid[row][col]
 
 
 */

extension Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        let rows: Int = grid.count
        let cols: Int = grid[0].count
        
        var dp: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: cols), count: rows)
        dp[0][0] = grid[0][0]
        // 0 行
        for col in 1 ..< cols  {
            dp[0][col] = dp[0][col - 1] + grid[0][col]
        }
        // 0列
        for row in 1 ..< rows {
            dp[row][0] = dp[row - 1][0] + grid[row][0]
        }
        
        for row in 1 ..< rows {
            for col in 1 ..< cols {
                dp[row][col] = max(dp[row - 1][col], dp[row][col - 1]) + grid[row][col]
            }
        }
        
        return dp[rows - 1][cols - 1]
    }
}

func maxValue() {
    let a = Solution.init().maxValue([[1,3,1],[1,5,1],[4,2,1]])
    print(a)
}
