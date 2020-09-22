import time

start_time = time.time()
print("What is your name?")
myName = input()
print("Hello, " + myName + ". That is a good name. How old are you?")
myAge = int(input())
if myAge < 13:
    print("You're a minor?")
elif myAge == 13:
    print("You're a teenager now. Nice.")
elif myAge > 13 and myAge < 30:
    print("Enjoy your liver while you can.")
elif myAge >= 30 and myAge < 65:
    print("Go tell some kids to get off your lawn.")
else:
    print("You're not dead yet?")

programAge = int(time.time() - start_time)
print("%s? That’s funny, I'm only %s seconds old." % (myAge, programAge))
print("I wish I was %s years old." % (myAge * 2))
time.sleep(3)
print("I'm tired. I'm going to sleep now")