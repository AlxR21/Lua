print("Hello World")
print("Day One!")
s = io.read()
print(s)


print("Day Two begins below")

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

print("Day Three")
--------------------------------------------------------------------
-- 1. “Class” system with metatables
--------------------------------------------------------------------
local Person = {}                              -- class table
Person.__index = Person                        -- methods lookup

-- constructor
function Person:new(name, age)
    local obj = { name = name, age = age }
    setmetatable(obj, self)
    return obj
end

-- instance method
function Person:greet()
    return ("Hi, I’m %s and I’m %d years old."):format(self.name, self.age)
end

-- operator overloading: adding two Person objects returns their combined age
function Person.__add(p1, p2)
    return p1.age + p2.age
end

-- “property” fallback via __index metamethod
Person.nickname = "Anonymous"

-- testing
local alice   = Person:new("Alice", 22)
local bob     = Person:new("Bob",   20)
print(alice:greet())                 --> Hi, I’m Alice and I’m 22 years old.
print("Combined age:", alice + bob)  --> 42
print("Bob’s nickname:", bob.nickname) -- falls back to class field

--------------------------------------------------------------------
-- 2. Coroutines: simple task scheduler
--------------------------------------------------------------------
-- a coroutine that counts to n with a delay (simulated)
local function counter(name, n)
    for i = 1, n do
        print(name, i)
        coroutine.yield()   -- give control back to scheduler
    end
end

-- scheduler
local co1 = coroutine.create(counter)
local co2 = coroutine.create(counter)
coroutine.resume(co1, "A", 3)   -- prime with args
coroutine.resume(co2, "B", 5)

while coroutine.status(co1) ~= "dead" or coroutine.status(co2) ~= "dead" do
    if coroutine.status(co1) ~= "dead" then coroutine.resume(co1) end
    if coroutine.status(co2) ~= "dead" then coroutine.resume(co2) end
end

--------------------------------------------------------------------
-- 3. File I/O: write, append, read
--------------------------------------------------------------------
local filename = "demo.txt"

-- write (overwrites if exists)
local fh = assert(io.open(filename, "w"))
fh:write("Line 1\n")
fh:close()

-- append
fh = assert(io.open(filename, "a"))
fh:write("Line 2\nLine 3\n")
fh:close()

-- read whole file
fh = assert(io.open(filename, "r"))
local contents = fh:read("*all")
fh:close()
print("\nFile contents:\n" .. contents)

--------------------------------------------------------------------
-- 4. Error handling
--------------------------------------------------------------------
local function risky_divide(a, b)
    if b == 0 then error("Division by zero!") end
    return a / b
end

-- pcall returns status + result|error
local ok, result = pcall(risky_divide, 10, 0)
if not ok then
    print("Caught error via pcall:", result)
end

-- xpcall lets you supply a custom traceback
local function traceback(err)
    return "Traceback:\n" .. debug.traceback(err, 2)
end

local ok2, res2 = xpcall(function() return risky_divide(8, 0) end, traceback)
if not ok2 then
    print("Caught error via xpcall:\n" .. res2)
end

--------------------------------------------------------------------


local mymath = require("mymath")
print("\n5! =", mymath.factorial(5))   --> 120
