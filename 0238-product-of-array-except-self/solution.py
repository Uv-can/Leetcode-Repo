class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        prefix, postfix = 1,1
        ans=[1]
        i = 1
        while i < len(nums):
            prefix = ans[i-1] * nums[i-1]
            ans.append(prefix)
            i+=1
        j= len(nums)-2
        while j >= 0:
            carry = ans[j]
            postfix *= nums[j+1]
            ans[j] = carry * postfix
            j-=1
        return ans



            
