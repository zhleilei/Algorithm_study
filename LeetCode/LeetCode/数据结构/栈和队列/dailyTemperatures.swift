//
//  dailyTemperatures.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*

 请根据每日 气温 列表，重新生成一个列表。对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。如果气温在这之后都不会升高，请在该位置用 0 来代替。

 例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。

 提示：气温 列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。
 
 https://leetcode-cn.com/problems/daily-temperatures/
 
 思路: 利用栈(这里使用数组), 求得右边第一个比他大的索引与当前索引的差值.
 
 */
extension Solution {
//class Solution_dailyTemperatures {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        if T.count == 0 {
            return []
        }
        var rs: [Int] = Array(repeating: 0, count: T.count)
        var stact: [Int] = [Int]()
        for index in 0 ..< T.count {
            #warning("zll test")
            while stact.count > 0 && T[index] > T[stact.last!] {
                let topIdx = stact.last
                rs[topIdx!] = index - topIdx!
                stact.removeLast()
                print("\(topIdx!)--\(rs[topIdx!])")
            }
            stact.append(index)
        }
        print(rs)
        return rs
    }
    #warning("zll  fix")
    // 倒推法
    
    // 倒推法精简版
    
    
    
    
}

func dailyTemperatures() {
    let temperatures = [73, 74, 75, 71, 69, 72, 76, 73]
    let _ = Solution.init().dailyTemperatures(temperatures)
}
