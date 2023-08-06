class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        min = prices[0]
        res = 0 
        for i in prices:
            if i < min:
                min = i
            res = max(res, i - min)
        return res
