# test.py

import math               # Importing the math module
import random as rnd       # Importing random module with an alias                

def findLargest(numbers):  # User-defined function
    return max(numbers)    # Return the largest number in the list

def greet(name):           # Another user-defined function
    print("Hello", {name}"!")  # Prints a greeting message

def add_numbers(a, b):     # Simple user-defined function  
    return a + b

def square(x):             # Another simple user-defined
    return x * x

print(square(add(3, 4))    # Attempt at nested function call
    
# Built-in function call
print("Hello, World!")     # Printing a string

# Function call from the math module
square_root = math.sqrt(16)  # Finding the square root of 16 using math.sqrt

# Function call from the random module (with alias rnd)
random_num = rnd.randint(1, 10)  # Generate a random integer between 1 and 10

# Object method call
test_list = [5, 3, 9, 1]
test_list.sort()            # Sort the list using the object method sort()

# Object method calls
name = "Trin"
upper_name = name.upper()   # Convert the string to uppercase using object method
print(upper_name)

# List append method (another object method)
test_list.append(42)        # Append an item to the list
print(test_list)
