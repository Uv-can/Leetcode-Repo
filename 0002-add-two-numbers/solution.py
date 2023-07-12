# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        num1,num2,tmp1,tmp2 = 0,0,1,1
        if l1.val == 0 and not l1.next:
            return l2
        elif l2.val == 0 and not l2.next:
            return l1
        while l1 or l2:
            if l1:
                num1 = num1 + l1.val * tmp1
                tmp1 *= 10
                l1 = l1.next
            if l2:
                num2 = num2 + l2.val * tmp2
                tmp2 *= 10
                l2 = l2.next

        num3 = num1 + num2

        dummy = ListNode(0)
        head = dummy
        while num3 > 0:
            num = num3%10
            newNode = ListNode(num)
            head.next = newNode
            head = head.next
            num3 = num3//10
        return dummy.next
