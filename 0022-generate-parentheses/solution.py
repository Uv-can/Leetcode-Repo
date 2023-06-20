class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        res = []

        cur_paras = []
        def backtrack(openN, closedN):
            if n == openN == closedN:
                res.append("".join(cur_paras))
                return
            
            if openN < n:
                cur_paras.append('(')
                backtrack(openN+1, closedN)
                cur_paras.pop()

            if closedN < openN:
                cur_paras.append(')')
                backtrack(openN, closedN+1)
                cur_paras.pop()
        
        backtrack(0,0)
        return res
