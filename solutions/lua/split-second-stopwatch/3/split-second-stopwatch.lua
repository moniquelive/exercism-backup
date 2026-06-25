local function fmt(dt) return os.date("!%T", dt) end

local Stopwatch = {}
function Stopwatch:new()
	local obj = { _state = "stopped" }
	setmetatable(obj, self)
	self.__index = self
	obj:reset()
	return obj
end
function Stopwatch:state() return self._state end
function Stopwatch:current_lap() return fmt(self._current_lap) end
function Stopwatch:total() return fmt(self._total) end
function Stopwatch:previous_laps() return self._laps end

function Stopwatch:start()
	assert(self._state ~= "running", "cannot start an already running stopwatch")
	self._state = "running"
end

function Stopwatch:stop()
	assert(self._state == "running", "cannot stop a stopwatch that is not running")
	self._state = "stopped"
end

function Stopwatch:reset()
	assert(self._state == "stopped", "cannot reset a stopwatch that is not stopped")
	self._state = "ready"
	self._current_lap = 0
	self._total = 0
	self._laps = {}
end

function Stopwatch:advance_time(timestamp)
	if self._state == "stopped" then return end
	local h, m, s = timestamp:match("(%d+):(%d+):(%d+)")
	local dt = tonumber(s) + tonumber(m) * 60 + tonumber(h) * 60 * 60
	self._current_lap = self._current_lap + dt
	self._total = self._total + dt
end

function Stopwatch:lap()
	assert(self._state == "running", "cannot lap a stopwatch that is not running")
	table.insert(self._laps, fmt(self._current_lap))
	self._current_lap = 0
end

return Stopwatch
