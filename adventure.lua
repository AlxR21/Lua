-- A simple text-based adventure game in Lua

-- 1. DEFINE THE GAME WORLD
-- We use a table to store all our room data. Each room is a key
-- in the 'rooms' table, and its value is another table containing
-- its description and possible exits.
local rooms = {
    start = {
        description = "You are in a dimly lit starting cave. A cold breeze comes from a passage to the north.",
        exits = { north = "hallway" }
    },
    hallway = {
        description = "You are in a narrow stone hallway. You can go back south or continue east into a wider cavern.",
        exits = { south = "start", east = "cavern" }
    },
    cavern = {
        description = "This is a large, echoing cavern. In the center, you see a glimmering treasure chest! You win!",
        exits = {} -- This is the final room, so there are no exits.
    }
}

-- 2. SET UP THE PLAYER
-- A variable to keep track of where the player is.
-- It starts at the 'start' key from our rooms table.
local player_location = "start"

print("--- Welcome to the Simple Cave Adventure! ---")



print("Type 'north', 'south', 'east', or 'west' to move.")
print("---------------------------------------------")

-- 3. THE MAIN GAME LOOP
-- This 'while true' loop will run forever until we explicitly 'break' out of it.
while true do
    -- Get the data for the room the player is currently in.
    local current_room = rooms[player_location]

    print("") -- Add a blank line for better readability.
    print(current_room.description)

    -- Check for the win condition.
    if player_location == "cavern" then
        break -- Exit the loop, ending the game.
    end

    -- Prompt the player for their next move.
    io.write("> ")
    local command = io.read() -- Read the line the player types.

    -- Check if the player's command is a valid exit from the current room.
    if current_room.exits[command] then
        -- If it is, update the player's location to the new room.
        player_location = current_room.exits[command]
    else
        -- If it's not a valid direction, inform the player.
        print("You can't go that way.")
    end
end

-- This line will only be reached after the loop breaks (the player wins).
print("\nCongratulations! Game Over.")