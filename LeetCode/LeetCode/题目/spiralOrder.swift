//
//  spiralOrder.swift
//  LeetCode
//
//  Created by zll on 2021/1/23.
//  Copyright © 2021 zll. All rights reserved.
//

/*

 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。

 示例 1:

 输入:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 输出: [1,2,3,6,9,8,7,4,5]
 示例 2:

 输入:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 输出: [1,2,3,4,8,12,11,10,9,5,6,7]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/spiral-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
    top, bottom, left, right
    奇数行,偶数列的需要判断
 
 */
extension Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.count == 0 {
            return []
        }
        var res = [Int]()
        var top = 0
        var bottom = matrix.count - 1
        var left = 0
        var right = matrix[0].count - 1
        while top <= bottom && left <= right {
            // lefttop->righttop
            for index in left ..< right + 1 {
                res.append(matrix[top][index])
            }
            top += 1
            if top > bottom {
                break
            }
            // righttop->rightbottom
            for index in top ..< bottom + 1 {
                res.append(matrix[index][right])
            }
            right -= 1
            if left > right {
                break
            }
            
            // rightbottom->leftbottom
            for index in stride(from: right - 1, through: left, by: -1) {
                res.append(matrix[bottom][index])
            }
            bottom -= 1
            
            if top > bottom {
                break
            }
            // leftbottom->lefttop
            for index in stride(from: bottom, through: top, by: -1) {
                res.append(matrix[index][left])
            }
            left += 1
            if left > right {
                break
            }
        }
        
        return res
    }
}
