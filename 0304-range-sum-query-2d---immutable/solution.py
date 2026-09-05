class NumMatrix:

    def __init__(self, matrix: List[List[int]]):
        ROWS, COLS = len(matrix), len(matrix[0])
        self.sumMat = [[0]* (COLS+1) for _ in range(ROWS+1)]

        for row in range( ROWS):
            total = 0
            for col in range(COLS):
                total  += matrix[row][col] 
                upper = self.sumMat[row][col+1]
                self.sumMat[row+1][col+1] = total + upper

    def sumRegion(self, row1: int, col1: int, row2: int, col2: int) -> int:
        row1, col1, row2, col2 = row1 + 1, col1 + 1, row2 + 1, col2 + 1
        
        right_bot = self.sumMat[row2][col2]
        left = self.sumMat[row2][col1-1]
        top = self.sumMat[row1-1][col2]
        top_left = self.sumMat[row1-1][col1-1]

        return right_bot - left - top + top_left


# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix(matrix)
# param_1 = obj.sumRegion(row1,col1,row2,col2)
