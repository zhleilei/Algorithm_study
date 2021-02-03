//
//  generateParenthesis.swift
//  LeetCode
//
//  Created by zll on 2021/1/28.
//  Copyright © 2021 zll. All rights reserved.
//

/*
    数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

     

    示例 1：

    输入：n = 3
    输出：["((()))","(()())","(())()","()(())","()()()"]
    示例 2：

    输入：n = 1
    输出：["()"]
     

    提示：

    1 <= n <= 8

    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/generate-parentheses
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class AASolution {
    var res = [String]()
    var list = [Character]()
    var n: Int?
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return [""]
        }
        self.n = n
        dfs(0, n, n)
        return res
    }
    func dfs(_ index: Int , _ leftR: Int, _ rightR: Int) {
        if index == n! << 1 {
            res.append(String(list))
            return
        }
        if leftR > 0 {
            list.append("(")
            dfs(index + 1, leftR - 1, rightR)
            list.removeLast()
        }
        
        if rightR > 0 && leftR != rightR {
            list.append(")")
            dfs(index + 1, leftR, rightR - 1)
            list.removeLast()
        }
    }
}
