class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        counted={}
        for i, num in enumerate(nums):
            
            if target - num in counted:
                return [counted[target-num],i]
            counted[num]=i
        return []
