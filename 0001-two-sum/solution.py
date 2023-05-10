class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        dict_map = {}
        for i, j in enumerate(nums):
            if (target-nums[i]) in dict_map:
                print(i, dict_map[target-nums[i]])
                return [i, dict_map[target-nums[i]]]
            dict_map[j] = i
