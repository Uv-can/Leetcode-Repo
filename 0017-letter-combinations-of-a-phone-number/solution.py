class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        number_map = {'2': 'abc',
                      '3': 'def',
                      '4': 'ghi',
                      '5': 'jkl',
                      '6': 'mno',
                      '7': 'pqrs',
                      '8': 'tuv',
                      '9': 'wxyz'}
        
        res = []
        def dfs(i, cur):
            if len(cur) == len(digits):
                res.append(cur)
                return
            
            for j in number_map[digits[i]]:
                dfs(i+1, cur+j )
        if digits:
            dfs(0,"")
        return res


