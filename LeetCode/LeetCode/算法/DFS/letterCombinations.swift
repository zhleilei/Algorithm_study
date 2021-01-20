//
//  letterCombinations.swift
//  LeetCode
//
//  Created by zll on 2021/1/16.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。



 示例:

 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
 
 */
#warning("zll test")

class Solution1 {
    let lettersArray: [[Character]] = [
        ["a", "b", "c"],
        ["d", "e", "f"],
        ["g", "h", "i"],
        ["j", "k", "l"],
        ["m", "n", "o"],
        ["p", "q", "r", "s"],
        ["t", "u", "v"],
        ["w", "x", "y", "z"]]
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        var list = Array<String>()
        let chars = digits.map{$0}
        var outputs = [Character]()
        dfs(0, chars, &outputs, &list)
        return list
    }
    
    func dfs(_ index: Int, _ chars: [Character], _ outputs: inout [Character], _ resluts: inout [String]) {
        
        if index == chars.count {// 最后一层
            resluts.append(String(outputs))
        }else {// 枚举当前层的所有选择
            let letters = lettersArray[chars[index].hexDigitValue! - 2]
            for letter in letters {
                outputs.append(letter)
                dfs(index + 1, chars, &outputs, &resluts)
                outputs.removeLast()
            }
        }
    }
    
}

