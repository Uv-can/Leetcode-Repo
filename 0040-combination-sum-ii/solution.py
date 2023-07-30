class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        candidates.sort()
        res = []

        def dfs(i, cur, target):
            if target == 0:
                res.append(cur.copy())
                return
            if target < 0 or i >= len(candidates):
                return
            
            cur.append(candidates[i])
            dfs(i+1, cur, target-candidates[i])
            cur.pop()

            while i+1 < len(candidates) and candidates[i] == candidates[i+1]:
                i += 1
            
            dfs(i+1, cur, target)
            
        
        dfs(0,[],target)
        return res
