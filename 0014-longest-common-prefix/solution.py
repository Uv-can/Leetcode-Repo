class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        ans=''
        strs.sort()
        for i in range(len(strs[0])):
            for s in strs:
                if len(s) == i or s[i] != strs[0][i]:
                    return ans
            ans += strs[0][i]
                
        return ans
