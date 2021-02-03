//
//  minDistance.swift
//  LeetCode
//
//  Created by zll on 2021/1/11.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。

 你可以对一个单词进行如下三种操作：

 插入一个字符
 删除一个字符
 替换一个字符
  

 示例 1：

 输入：word1 = "horse", word2 = "ros"
 输出：3
 解释：
 horse -> rorse (将 'h' 替换为 'r')
 rorse -> rose (删除 'r')
 rose -> ros (删除 'e')
 示例 2：

 输入：word1 = "intention", word2 = "execution"
 输出：5
 解释：
 intention -> inention (删除 't')
 inention -> enention (将 'i' 替换为 'e')
 enention -> exention (将 'n' 替换为 'x')
 exention -> exection (将 'n' 替换为 'c')
 exection -> execution (插入 'u')
  

 提示：

 0 <= word1.length, word2.length <= 500
 word1 和 word2 由小写英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/edit-distance
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 思路:
    考虑四种情况
    最后一种操作是删除操作, 插入操作, 替换操作
    s1[i- 1] = s2[j - 1] 不做任何操作
 */

extension Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.count == 0 || word2.count == 0 {
            return word1.count + word2.count
        }
        let arr1 = Array(word1)
        let arr2 = Array(word2)
        
        let row = arr1.count + 1
        let col = arr2.count + 1
        
        var dp = Array(repeating: Array(repeating: 0, count: col), count: row)
        
        dp[0][0] = 0
        
        for i in 1 ..< row {
            dp[i][0] = i
        }
        
        for j in 1 ..< col {
            dp[0][j] = j
        }
        
        for i in 1 ..< row {
            for j in 1 ..< col {
                let top = dp[i - 1][j] + 1
                let left = dp[i][j - 1] + 1
                var leftTop = dp[i - 1][j - 1]
                if arr1[i - 1] != arr2[j - 1] {
                    leftTop += 1
                }
                dp[i][j] = min(top, left, leftTop)
            }
        }
        
        return dp[arr1.count][arr2.count]
    }
}
