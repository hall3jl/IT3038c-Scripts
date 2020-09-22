import random

randint = random.randint(1,10)

guess = int(input("Guess a number between 1 and 10: "))

while guess != randint:
    if randint < guess:
        print("Your guess, " + str(guess) + ", is too high")
        guess = int(input("Please guess again: "))
        print("")
    elif randint > guess:
        print("Your guess, " + str(guess) + ", is too low")
        guess = int(input("Please guess again: "))
        print("")
    
print("Congratulations! %s is the correct number." % guess)