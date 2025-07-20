-- Basic Todo List Project in Lua

local tasks = {}             -- table to hold tasks
local fileName = "tasks.txt" -- file for saving/loading

-- Load tasks from file
local function loadTasks()
    local file = io.open(fileName, "r")
    if file then
        for line in file:lines() do
            table.insert(tasks, line)
        end
        file:close()
    end
end

-- Save tasks to file
local function saveTasks()
    local file = io.open(fileName, "w")
    for _, task in ipairs(tasks) do
        file:write(task .. "\n")
    end
    file:close()
end

-- Show all tasks
local function showTasks()
    print("\nYour Todo List:")
    if #tasks == 0 then
        print("  No tasks found.")
    else
        for i, task in ipairs(tasks) do
            print("  [" .. i .. "] " .. task)
        end
    end
end

-- Add a new task
local function addTask()
    io.write("Enter a new task: ")
    local task = io.read()
    if task and task ~= "" then
        table.insert(tasks, task)
        print("Task added!")
    else
        print("Task cannot be empty.")
    end
end

-- Remove a task
local function removeTask()
    showTasks()
    io.write("Enter task number to remove: ")
    local num = tonumber(io.read())
    if num and tasks[num] then
        table.remove(tasks, num)
        print("Task removed!")
    else
        print("Invalid task number.")
    end
end

-- Menu loop
local function main()
    loadTasks()

    while true do
        print("\n== Todo List Menu ==")
        print("1. View Tasks")
        print("2. Add Task")
        print("3. Remove Task")
        print("4. Save & Exit")
        io.write("Choose an option (1-4): ")

        local choice = io.read()

        if choice == "1" then
            showTasks()
        elseif choice == "2" then
            addTask()
        elseif choice == "3" then
            removeTask()
        elseif choice == "4" then
            saveTasks()
            print("Tasks saved. Goodbye!")
            break
        else
            print("Invalid option. Please choose 1-4.")
        end
    end
end

-- Start the app
main()
