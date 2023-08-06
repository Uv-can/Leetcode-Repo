class Solution:
    def isPalindrome(self, s: str) -> bool:
        char = ''
        
        for i in s:
            if self.isnumal(i):
                char+=i.lower()
        return char == char[::-1] 

    def isnumal(self, char):
        return  (ord('a') <= ord(char) <= ord('z') or
                 ord('A') <= ord(char) <= ord('Z') or
                 ord('0') <= ord(char) <= ord('9'))

