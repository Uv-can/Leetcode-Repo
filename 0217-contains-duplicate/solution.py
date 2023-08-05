class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        dups = set()
        for i in nums:
            if i in dups:
                return True
            dups.add(i)

        return False
