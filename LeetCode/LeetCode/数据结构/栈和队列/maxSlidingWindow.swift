//
//  maxSlidingWindow.swift
//  LeetCode
//
//  Created by macMini on 2020/10/17.
//  Copyright © 2020 zll. All rights reserved.
//

/*
 给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。

  

 进阶：

 你能在线性时间复杂度内解决此题吗？

  

 示例:

 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
  

 提示：

 1 <= nums.length <= 10^5
 -10^4 <= nums[i] <= 10^4
 1 <= k <= nums.length

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sliding-window-maximum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路: 使用双端队列(使用数组模拟)
 队列存放的是索引
 队列中的元素从头到尾是逐渐减小的 (添加元素的时候判断大小)
 检查是否有效无效的话也要从队列中移除掉
 记录最值
 往后移动继续重复上述过程
 
 1.nums[i] >= 队尾 删除队尾, 直到队尾 > nums[i]
 2.将i加入队尾
 3.w >= 0
    队列头部如果失效就移除对头 (< w失效)
    设置w窗口的最大值为对头
 
 
 类似: https://leetcode-cn.com/problems/hua-dong-chuang-kou-de-zui-da-zhi-lcof/
 */
extension Solution {
//class Solution_maxSlidingWindow {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0  || k < 1 {
            return []
        }
        if  k == 1 {
            return nums
        }
        var rs: [Int] = [Int]()
        var queue: [Int] = [Int]()
        
        for (index, _) in nums.enumerated() {
            // 1.nums[i] >= 队尾 删除队尾, 直到队尾 > nums[i]
            while queue.count > 0 && nums[index] >= nums[queue.last!] {
                queue.removeLast()
            }
            // 2.将i加入队尾
            queue.append(index)
            // 3.检验w有效性
            let w = index - (k - 1)
            if w < 0 {
                continue
            }
            //  队列头部如果失效就移除对头 (< w失效)
            if queue.first! < w {
                queue.removeFirst()
            }
            //  设置w窗口的最大值为对头
            rs.append(nums[queue.first!])
        }
        
        return rs
    }
}

func Solution_maxSlidingWindow() {
    let nums = [1,3,-1,-3,5,3,6,7], k = 3
    let rs = Solution.init().maxSlidingWindow(nums, k)
    print(rs)
}
