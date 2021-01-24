//
//  threeSum.swift
//  LeetCode
//
//  Created by zll on 2021/1/22.
//  Copyright © 2021 zll. All rights reserved.
//

/*
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 示例 2：

 输入：nums = []
 输出：[]
 示例 3：

 输入：nums = [0]
 输出：[]
  

 提示：

 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路:
    先排序, i, l, r 三指针. 通过三个值的和来处理l r的移动
    i向右移动如果i+1 = i continue.
    nums[i] + nums[l] + nums[r] = 0,  移动l和r时也要做判断
 */
//[-1,0,1,2,-1,-4]
extension Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        let nums = nums.sorted()
        var res = [[Int]]()
        
        let lastIndex = nums.count - 2
        let lastR = nums.count - 1
        for index in 0 ..< lastIndex {
            // 判断当前值与之前是否有重复的
            if index > 0 && nums[index] == nums[index - 1] {
                continue
            }
            var l = index + 1
            var r = lastR
            let remain = -nums[index]
            while l < r {
                let sumlr = nums[l] + nums[r]
                if sumlr == remain {
                    res.append([nums[index], nums[l], nums[r]])
                    while l < r && nums[l] == nums[l + 1] {
                        l += 1
                    }
                    while l < r && nums[r] == nums[r - 1] {
                        r -= 1
                    }
                    l += 1
                    r -= 1
                } else if sumlr < remain {
                    l += 1
                }else {
                    r -= 1
                }
            }
            
        }
//        print(res)
        return res
    }
}

func threeSum() {
    let nums = [-1,0,1,2,-1,-4]
    let _ = Solution.init().threeSum(nums)
}
