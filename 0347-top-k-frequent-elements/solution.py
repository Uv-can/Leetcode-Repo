from collections import defaultdict
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        count_dict = defaultdict(list)
        for num in nums:
            count_dict[num] = 1 + count_dict.get(num, 0)
        counter = [[] for i in range(len(nums)+1)]
        for key, value in count_dict.items():
            counter[value].append(key)
        res = []
        for i in range(len(counter)-1, 0, -1):
            for num in counter[i]: 
                res.append(num)
                if len(res) == k:
                    return res
