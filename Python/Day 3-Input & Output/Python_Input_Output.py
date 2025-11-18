#Python Input_Output

''' In this module, we will learn about print() and input() functions.
There are two different types of inputs.
1) Developer Default -> Eg). age=10, name="Ashnu"
2) User input() -> Eg). age=int(input()), name=input()

There are different parameters of print() functions:
1) print(name,age,rating,end=" ") -> It is used to print any character at end of print() function and default value of end parameter is "\n"
2) print(name,age,rating,sep=" ") -> It separates the variable and we can assign with any character and default value of sep parameter is " ".'''

#Developer Default Input

name="Ashnu"
age=22
rating=4.5

#Printing Statements

print(name)
print(age)
print(rating)

#Printing the type of variable -> using type()

print(type(name))
print(type(age))
print(type(rating))

#Printing and Joining Statements using comma

print("Your name is:",name)
print("Your age is:",age)
print("Your rating is:",rating)

#Another method to print the output with specific data type using % operator and derived from C language

print("Your name is: %s"%(name))
print("Your age is: %d"%(age))
print("Your rating is: %.3f"%(rating))

#Print() Parameter-end() -> It is used to print any character at end of print() function and default value of end parameter is "\n"

print(name,end=" ")
print(age,end=" years ")
print(rating)

#Print() Parameter-sep() -> It separates the variable and we can assign with any character and default value of sep parameter is " "

print(name,age,rating,sep=',')
print("Your name: %s"%(name),"Your age: %d"%(age),"Your rating: %.2f"%(rating),sep="\n")

#String concatenation (+)-> It only accepts string inputs. If it is an other input, use str() function to convert the string.

print("My name is "+name+" and I am "+str(age)+" years old.")

#User Defined Inputs

print("Enter Your full name:",end=" ")
name2=input()
print("Your full name is: %s"%(name2))
print("Enter your age:",end=" ")
age2=int(input())
print("Your age is: %d"%(age2))
print("Enter your rating:",end=" ")
rating2=float(input())
print("Your rating given is: %.3f"%(rating2))
