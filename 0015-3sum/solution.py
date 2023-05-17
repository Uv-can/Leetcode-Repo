class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        result=[]
        for index in range(len(nums)):
            while nums[index] > 0:
                break
            if index > 0 and nums[index] == nums[index-1]:
                continue
            left, right = index+1, len(nums)-1
            while left < right :
                if nums[right] + nums[left] < 0 - nums[index]:
                    left += 1
                elif nums[right] + nums[left] > 0 - nums[index]:
                    right -= 1
                else:
                    result.append([nums[index],nums[left],nums[right]])
                    left += 1
                    right -= 1
                    while nums[left] == nums[left-1] and left < right:
                        left += 1
        return result
