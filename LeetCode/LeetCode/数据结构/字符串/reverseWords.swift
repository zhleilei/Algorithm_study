//
//  reverseWords.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
    给定一个字符串，逐个翻转字符串中的每个单词。

    说明：

    无空格字符构成一个 单词 。
    输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
    如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
     

    示例 1：

    输入："the sky is blue"
    输出："blue is sky the"
    示例 2：

    输入："  hello world!  "
    输出："world! hello"
    解释：输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
    示例 3：

    输入："a good   example"
    输出："example good a"
    解释：如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
    示例 4：

    输入：s = "  Bob    Loves  Alice   "
    输出："Alice Loves Bob"
    示例 5：

    输入：s = "Alice does not even like bob"
    输出："bob like even not does Alice"
     

    提示：

    1 <= s.length <= 104
    s 包含英文大小写字母、数字和空格 ' '
    s 中 至少存在一个 单词
     

    进阶：

    请尝试使用 O(1) 额外空间复杂度的原地解法。

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/reverse-words-in-a-string
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
    方法一:使用swift的API
    方法二:1.消除空格 2.全部逆序 3.对每个单词逆序
 类似: https://leetcode-cn.com/problems/fan-zhuan-dan-ci-shun-xu-lcof/
 */
extension Solution {
//class Solution_reverseWords {
    func reverseWords_api(_ s: String) -> String {
                let list = s.split(separator: " ")
                let rlist = list.reversed()
                return rlist.joined(separator: " ")
    }
    // 字符串转数组?
    func reverseWords(_ s: String) -> String {
        // 消除空格 通过双指针移动的方式
        // 字符串的有效长度
        var space = true
        var charStr = [Character]()
        for ch in s {
            if ch != " " {
                charStr += "\(ch)"
                space = false
            }else if space == false {
                charStr += " "
                space = true
            }
        }
        if space == true {
            // 删除最后一个 sapce
            charStr.removeLast()
        }
        // 翻转全部字符
        let len = charStr.count
        reverseString(&charStr, 0, len)
        
        // 翻转以space为间隔的,除最后一个之外的字符串
        var preIndex = -1
        for i in 0 ..< len {
            if charStr[i] == " "{
                reverseString(&charStr, preIndex + 1, i)
                preIndex = i
            }
        }
        // 翻转最后一个单词
        reverseString(&charStr, preIndex + 1, len)
        
        // 拼接成字符串
        var str = ""
        for ch in charStr {
            str += "\(ch)"
        }
        return str
    }
    
    func reverseString(_ chars: inout [Character], _ l: Int, _ r: Int) {
            var m = l
            var n = r - 1
        while m < n {
            let x = chars[m]
            chars[m] = chars[n]
            chars[n] = x
            m += 1
            n -= 1
        }
    }
}

func reverseWords() {
    let str = "Alice does not even like bob"
    let reStr = Solution.init().reverseWords(str)
    print(reStr)
    
}
