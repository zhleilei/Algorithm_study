//
//  lengthOfLongestSubstring.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路: 画图
    分三种情况  0.....pi..li..i-1 i...  比较pi(i上一次出现的位置)和li(i-1的最长不重复子串)
 */
#warning("zll fix")
extension Solution {
//class Solution_lengthOfLongestSubstring {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        let charsValArr = s.unicodeScalars.map { Int($0.value) }
        var preIndexArr = Array(repeating: -1, count: 128)
        // i-1 位置字符结尾的最长不重复字符串开始索引
        var left = -1
        var maxCount = 1
        // 方式一
//        for i in 0..<charsValArr.count {
//            left = max(left, preIndexArr[charsValArr[i]])
//            preIndexArr[charsValArr[i]] = i
//            maxCount = max(maxCount, i - left)
//        }
        // 方式二
        for i in 0..<charsValArr.count {
            // 当前字符上一次出现的位置
            let pi = preIndexArr[charsValArr[i]]
            if left <= pi {
                left = pi + 1
            }
            // 存储当前字符出现的位置
            preIndexArr[charsValArr[i]] = i
            maxCount = max(maxCount, i - left + 1)
        }
        
        return maxCount
    }
}
