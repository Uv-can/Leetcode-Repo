class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        length = len(nums) - k+1
        heapq.heapify(nums)
        res = 0
        while length > 0:
            res = heapq.heappop(nums)
            length -= 1
        return res
        
