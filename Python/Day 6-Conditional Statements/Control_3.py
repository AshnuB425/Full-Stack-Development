n=int(input("Number of ball facing = "))
match n:
    case 0:
        print("Diamond Duck")
    case 1:
        print("Golden Duck")
    case _:
        print("Duck Out")
