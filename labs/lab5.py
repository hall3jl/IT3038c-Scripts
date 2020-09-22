import random

randint = random.randint(1,10)

print("Guess a number between 1 and 10:")
guess = int(input())

while guess != randint:
    if randint < guess:
        print("Your guess: " + str(guess) + " is too high")
        print("Please guess again:")
        guess = int(input())
        print("")
    elif randint > guess:
        print("Your guess: " + str(guess) + " is too low")
        print("Please guess again:")
        guess = int(input())
        print("")
    
print("Congratulations! %s is the correct number." % guess)