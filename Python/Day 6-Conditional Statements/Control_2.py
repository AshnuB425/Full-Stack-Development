n=int(input("Enter the year: "))
if n%400==0:
    print("The given year is a leap year")
elif n%100==0:
    print("The given year is not a leap year")
elif n%4==0:
    print("The given year is a leap year")
else:
    print("The given year is not a leap year")
