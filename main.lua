print("Hello World")
print("Day One!")
s = io.read()
print(s)

--[[ 
  Demonstration of Lua Programming Constructs:
  - Loops
  - Conditionals
  - Functions
  - Operations
--]]

-- Arithmetic Operations
local a = 10
local b = 3
print("Addition: ", a + b)          -- 13
print("Subtraction: ", a - b)       -- 7
print("Multiplication: ", a * b)    -- 30
print("Division: ", a / b)          -- 3.333...
print("Modulus: ", a % b)           -- 1
print("Exponentiation: ", a ^ b)    -- 1000

-- String Concatenation
local str1 = "Hello"
local str2 = "World"
print("Concatenation: ", str1 .. " " .. str2) -- Hello World

-- Relational Operators
print("a > b:", a > b)       -- true
print("a < b:", a < b)       -- false
print("a == b:", a == b)     -- false
print("a ~= b:", a ~= b)     -- true
print("a >= b:", a >= b)     -- true
print("a <= b:", a <= b)     -- false

-- Logical Operators
print("true and false:", true and false)   -- false
print("true or false:", true or false)     -- true
print("not true:", not true)               -- false

-- Conditional Statements
local x = 15

if x < 10 then
    print("x is less than 10")
elseif x == 10 then
    print("x is equal to 10")
else
    print("x is greater than 10")
end

-- For Loop (numeric)
print("\nFor Loop from 1 to 5:")
for i = 1, 5 do
    print("i =", i)
end

-- For Loop with step
print("\nFor Loop with step:")
for i = 10, 1, -2 do
    print("i =", i)
end

-- While Loop
print("\nWhile Loop:")
local count = 1
while count <= 3 do
    print("count =", count)
    count = count + 1
end

-- Repeat Until Loop (runs at least once)
print("\nRepeat Until Loop:")
local n = 1
repeat
    print("n =", n)
    n = n + 1
until n > 3

-- Function Definition
function greet(name)
    return "Hello, " .. name
end

-- Calling the function
local message = greet("Alok")
print("\nGreeting: ", message)

-- Function to check even or odd
function isEven(num)
    if num % 2 == 0 then
        return true
    else
        return false
    end
end

print("\nIs 4 even? ", isEven(4))  -- true
print("Is 7 even? ", isEven(7))    -- false

-- Anonymous Function and usage
local square = function(n)
    return n * n
end

print("\nSquare of 5: ", square(5)) -- 25

-- Table iteration with pairs
local colors = {"red", "green", "blue"}
print("\nIterating over table using pairs:")
for index, color in pairs(colors) do
    print(index, color)
end
