class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        cnt = set()
        for num in nums:
            if num in cnt:
                return True
            cnt.add(num)
        return False    
