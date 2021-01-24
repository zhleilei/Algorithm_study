//
//  reverse.swift
//  LeetCode
//
//  Created by zll on 2021/1/23.
//  Copyright © 2021 zll. All rights reserved.
//
/*
    给你一个 32 位的有符号整数 x ，返回 x 中每位上的数字反转后的结果。

    如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

    假设环境不允许存储 64 位整数（有符号或无符号）。
     

    示例 1：

    输入：x = 123
    输出：321
    示例 2：

    输入：x = -123
    输出：-321
    示例 3：

    输入：x = 120
    输出：21
    示例 4：

    输入：x = 0
    输出：0
     

    提示：

    -231 <= x <= 231 - 1


    来源：力扣（LeetCode）
    链接：https://leetcode-cn.com/problems/reverse-integer
    著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路
    
 */

extension Solution {
    func reverse(_ x: Int) -> Int {
        var rs = 0
        var x = x
        while x != 0 {
            rs = rs * 10 + x % 10
            if  rs > Int32.max  || rs < Int32.min{
                return 0
            }
            x /= 10
        }
        return rs
    }
}
