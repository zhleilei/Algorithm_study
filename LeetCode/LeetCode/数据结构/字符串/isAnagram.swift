//
//  isAnagram.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
 说明:
 你可以假设字符串只包含小写字母。

 进阶:
 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-anagram
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 思路:1.遍历字符串中的元素放到, 26个字母对应的数组中, 遍历到相同的一个加一
    2.遍历第二个字符, 遍历到相同的字符减一  有<0 的表示非字母异位词
    
 类似:
 https://leetcode-cn.com/problems/group-anagrams/
 https://leetcode-cn.com/problems/group-anagrams-lcci/
 https://leetcode-cn.com/problems/group-anagrams-lcci/
 */
extension Solution {
//class Solution_isAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count == 0 && t.count == 0 {
            return true
        }
        if s.count != t.count {
            return false
        }
        var arr: [Int] = Array(repeating: 0, count: 26)
        // 注意swift中获取对应的ASCII码方法
        let a = Int("a".unicodeScalars.first!.value)
        for charater in s.unicodeScalars {
            arr[Int(charater.value) - a] += 1
        }
        
        for charater in t.unicodeScalars {
            arr[Int(charater.value) - a] -= 1
            if arr[Int(charater.value) - a] < 0 {
                return false
            }
        }
        
        return true
    }
}
