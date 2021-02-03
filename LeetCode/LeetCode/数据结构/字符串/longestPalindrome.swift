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
 暴力法: 使用双指针遍历所有的情况
1. 动态规划:
 <=2时: dp[i][j] = s[i] = s[j],
 > 2时: dp[i][j] = dp[i+1][j-1] && s[i] == s[j]
2. 中心扩展方式(以字符和间隙作为扩展中心), (优化可以将连续的相同字符作为一个扩展中心)
3. Manacher (??) ^#$ 插入字符
 */
extension Solution {
// 动态规划
//    func longestPalindrome(_ s: String) -> String {
//        if s.count <= 1 {
//            return s
//        }
//        let strArr = Array(s)
//        var maxL = 1
//        var begin = 0
//
//        var dp = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
//
//        for i in (0 ..< s.count).reversed() {
//            for j in i ..< s.count {
//                let len = j - i + 1
//                dp[i][j] = (strArr[i] == strArr[j]) && (len <= 2 || dp[i + 1][j - 1])
//                if dp[i][j] && len > maxL{
//                    maxL = len
//                    begin = i
//                }
//            }
//        }
//        return String(strArr[begin ..< begin + maxL])
//    }
// 中心扩展
}

func longestPalindrome() {
//    let _ =  Solution.init().longestPalindrome("xxx")
}

#warning("zll 动态规划 + 中心扩展方式 Manacher")
