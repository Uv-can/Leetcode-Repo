class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        ROWS, COLS = len(board), len(board[0])
        visit = set()
        def backtrack(i,r,c):
            if i == len(word):
                return True
            if (r < 0 or c < 0 or
                c >= COLS or r >= ROWS or (r,c) in visit
                or word[i] != board[r][c]):
                return 
            
            visit.add((r,c))
            res = (backtrack(i+1,r+1,c) or
                  backtrack(i+1,r-1,c) or
                  backtrack(i+1,r,c-1) or
                  backtrack(i+1,r,c+1))
            visit.remove((r,c))
            return res
        
        for r in range(ROWS):
            for c in range(COLS):
                if backtrack(0, r, c):
                    return True
        
        return False

