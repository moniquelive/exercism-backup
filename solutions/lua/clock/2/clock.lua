local M = {}
M.__index = M

function M.at(h, m) return setmetatable({ minutes = h * 60 + (m or 0) }, M) end

function M:__tostring() return ("%02d:%02d"):format(self.minutes // 60 % 24, self.minutes % 60) end

function M:equals(other) return tostring(self) == tostring(other) end

function M:minus(delta) return self:plus(-delta) end

function M:plus(delta) return M.at(0, self.minutes + delta) end

return M
