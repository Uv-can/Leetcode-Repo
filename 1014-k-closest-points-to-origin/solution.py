class Solution:
    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
        heap = []
        for i in points:
            dist = (i[0]**2) + (i[1]**2)
            heap.append([dist,i[0],i[1]])
        heapq.heapify(heap)
        res = []

        while k > 0:
            dist, x, y = heapq.heappop(heap)
            res.append([x,y])
            k -= 1
        
        return res
