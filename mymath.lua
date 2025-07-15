--  Simple module usage

local M = {}

function M.factorial(n)
    assert(n >= 0 and n == math.floor(n), "n must be a non‑negative integer")
    if n == 0 then return 1 end
    return n * M.factorial(n - 1)
end

return M
