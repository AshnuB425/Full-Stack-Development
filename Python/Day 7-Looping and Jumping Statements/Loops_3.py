n=int(input("Enter the decimal number: "))
ans=0
i=0
while n>0:
    ans+=(n%2)*(10**i)
    n//=2
    i+=1
print("The binary number is:",ans)
