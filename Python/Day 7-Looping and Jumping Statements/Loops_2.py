n=int(input("Enter the number:"))
sum1=0
sum2=0
sum3=0
for i in range(1,n+1):
    sum1+=i
for i in range(1,n+1,2):
    sum2+=i
for i in range(2,n+1,2):
    sum3+=i
print("The sum of numbers from 1 to n=",sum1)
print("The sum of odd numbers from 1 to n=",sum2)
print("The sum of even numbers from 1 to n=",sum3)
