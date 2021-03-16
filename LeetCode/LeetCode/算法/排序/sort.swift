//
//  sort.swift
//  LeetCode
//
//  Created by zll on 2021/3/13.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 思路:
 
 排序算法
 1.比较排序
 冒泡, 选择, 插入, 归并, 快速, 希尔, 堆排序

 快速排序:
 数据中选择一个元素作为”基准”（pivot），通常选取最后一个元素；
 分区(partition) 所有小于”基准”的元素，都移到”基准”的左边；所有大于”基准”的元素，都移到”基准”的右边。分区操作结束后，基准元素所处的位置就是最终排序后它的位置。
 对”基准”左边和右边的两个子集，不断重复第一步和第二步，直到所有子集只剩下一个元素为止。

 
 2.非比较排序(空间换时间)
 计数排序、桶排序、基数排序
 */


import Foundation


// 冒泡排序
func bubble() {
    var array: [Int] = [2,5,3,1,4,8,10,7,6,9]
    for i in 0..<array.count {
        for j in 0..<array.count - (i+1) {
            if array[j] > array[j+1] {
//                let temp = array[j]
//                array[j] = array[j+1]
//                array[j+1] = temp
                array[j] = array[j] + array[j+1];
                array[j+1] = array[j] - array[j+1];
                array[j] = array[j] - array[j+1];
                }
            }
        }
    for i in 0..<array.count {
        print(array[i])
    }
    // 复杂度 O(n^2)
    // 优化?
}



// 选择排序
func selection() {
    var array: [Int] = [2,5,3,1,4,8,10,7,6,9]
    for i in 0..<array.count {
        var min = i
        for j in i+1..<array.count {
            if array[j] < array[min] {
                min = j
            }
        }
        
        let temp = array[min]
        array[min] = array[i]
        array[i] = temp
    }
    print(array)
}

// 插入排序
func insertSort() {
    var a: [Int] = [2,5,3,1,4,8,10,7,6,9]
    for j in 1...a.count-1 {
        let n = a[j]
        var i = j - 1
        while i >= 0 && a[i] > n {
            let temp = a[i+1]
            a[i+1] = a[i]
            a[i] = temp
            i = i - 1
        }
    }
    print(a)
}

func testQuickSort() {
    let data:[Int] = [1,2,3,2,4,8,9,10,19,0]
    let result = quickSort(data: data)
    print("FlyElephant:-\(result)")
}

// 快速排序
// https://www.jianshu.com/p/5a81ba81886d
func quickSort(data:[Int])->[Int]{
    if data.count<=1 {
        return data
    }
    
    var left:[Int] = []
    var right:[Int] = []
    let pivot:Int = data[data.count-1]
    for index in 0..<data.count-1 {
        if data[index] < pivot {
            left.append(data[index])
        }else{
            right.append(data[index])
        }
    }
    
    var result = quickSort(data: left)
    result.append(pivot)
    let rightResult = quickSort(data: right)
    result.append(contentsOf: rightResult)
    return result
}
