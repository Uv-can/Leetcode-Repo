class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        res = []

        def dfs(i, cur, total):
            #We need to return subset sum of target
            if total == target:
                res.append(cur.copy())
                return
            #if sum is greater then target or index is out of range
            if i >= len(candidates) or total > target:
                return
            
            #Choice when we will use the same number again and again
            cur.append(candidates[i])
            dfs(i, cur, total+candidates[i])
            #Choice when we will not consider the already used number
            cur.pop()
            dfs(i+1, cur, total)
        
        dfs(0,[],0)
        
        return res

