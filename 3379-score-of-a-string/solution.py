class Solution:
    def scoreOfString(self, s: str) -> int:
        res = 0
        l = 0
        for c in range(1, len(s)):
            num1 = ord(s[l])
            num2 = ord(s[c])
            res += abs(num1 - num2)
            l += 1
        
        return res
