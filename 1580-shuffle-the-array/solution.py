class Solution:
    def shuffle(self, nums: List[int], n: int) -> List[int]:
        i=0
        half=len(nums)//2
        ans = []
        while i < half:
            ans.append(nums[i])
            ans.append(nums[i+half])
            i+=1
        return ans
