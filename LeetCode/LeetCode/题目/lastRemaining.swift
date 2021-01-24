//
//  lastRemaining.swift
//  LeetCode
//
//  Created by zll on 2021/1/23.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 0,1,···,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字（删除后从下一个数字开始计数）。求出这个圆圈里剩下的最后一个数字。

 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。

  

 示例 1：

 输入: n = 5, m = 3
 输出: 3
 示例 2：

 输入: n = 10, m = 17
 输出: 2
  

 限制：

 1 <= n <= 10^5
 1 <= m <= 10^6

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
    约瑟夫huan问题
    
    计算公式 f(n, m) = (f(n - 1, m) + m) % n  (推导过程)
    
    其他: 计算编号从1开始的, 要先计算编号从0开始的
 */

extension Solution {
    // 递归的方式
    func lastRemaining1(_ n: Int, _ m: Int) -> Int {
        if n == 1 {
            return 0
        }
        return (lastRemaining1(n - 1, m) + m) % n
    }
    
    // 非递归的方式
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var res = 0
        for index in 2 ..< n + 1 {
            res = (res + m) % index
        }
        return res
    }
}
