class Solution:
    def isPalindrome(self, s: str) -> bool:
        char = ''
        
        for i in s:
            if i.isalnum():
                char+=i.lower()
        return char == char[::-1] 
