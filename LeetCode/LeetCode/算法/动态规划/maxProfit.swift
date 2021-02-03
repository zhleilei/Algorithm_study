//
//  maxProfit.swift
//  LeetCode
//
//  Created by zll on 2021/1/11.
//  Copyright © 2021 zll. All rights reserved.
//
/*
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 如果你最多只允许完成一笔交易（即买入和卖出一支股票一次），设计一个算法来计算你所能获取的最大利润。

 注意：你不能在买入股票前卖出股票。

  

 示例 1:

 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 示例 2:

 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
 记录最小值和最大利润
 i天卖出(比较当前天卖出的最大利润和总的最大利润)
 */
extension Solution {
    func maxProfit1(_ prices: [Int]) -> Int {
        if prices.count == 0 {
            return 0
        }
        var minPrice: Int = prices[0]
        var maxProfit: Int = 0
        
        for i in 1 ..< prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            }else { // i天卖出(比较当前天卖出的最大利润和总的最大利润)
                maxProfit = max(maxProfit, prices[i] - minPrice)
            }
        }
        return maxProfit
    }
    #warning("zll 最大连续子序列和")
    // 动态规划方式, 找出最大连续子序列和
    func maxProfit(_ prices: [Int]) -> Int {
        return 0
    }
}
