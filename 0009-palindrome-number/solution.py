class Solution:
    def isPalindrome(self, x: int) -> bool:
        ans=0
        num = x
        if x < 0:
            return False
        
        while x > 0:
            ans = (ans * 10) + (x%10)
            x = x//10
          
        if ans == num:
            return True
        return False
