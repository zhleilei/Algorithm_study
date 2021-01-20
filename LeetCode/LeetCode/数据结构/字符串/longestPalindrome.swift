//
//  longestPalindrome.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 思路:
1. 动态规划:
 <=2时: dp[i][j] = s[i] = s[j],
 > 2时: dp[i][j] = dp[i+1][j-1] && s[i] == s[j]
2. 中心扩展方式(以字符和间隙作为扩展中心), (优化可以将连续的相同字符作为一个扩展中心)
3. Manacher (??)
 */
extension Solution {
//class Solution_longestPalindrome {
    func longestPalindrome(_ s: String) -> String {
        return ""
    }
}

func longestPalindrome() {
    let _ =  Solution.init().longestPalindrome("xxx")
}

#warning("zll 动态规划 + 中心扩展方式 Manacher")
