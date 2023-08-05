class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        wordMap = collections.defaultdict(list)
        

        for word in strs:
            count = [0]*26
            for w in word:
                count[ord(w) - ord('a')] += 1
            wordMap[tuple(count)].append(word)

        return wordMap.values()



