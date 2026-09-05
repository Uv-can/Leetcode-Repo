class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        n = len(nums)

        while True:
            i = random.choice(nums)
            if nums.count(i) > n//2:
                return i
