n=int(input("Enter the number: "))
if n%3==0 and n%5==0:
    print(n,"->","Divisible by both 3 and 5")
elif n%3==0:
    print(n,"->","Divisible by only 3")
elif n%5==0:
    print(n,"->","Divisible by only 5")
else:
    print(n,"->","Not divisible by both 3 and 5")
