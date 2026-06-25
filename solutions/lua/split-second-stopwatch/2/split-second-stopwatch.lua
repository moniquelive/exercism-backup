local function fmt(dt) return os.date("!%T", dt) end

local Stopwatch = {}
function Stopwatch:new()
	local obj = {
		_total = 0,
		_state = "ready",
		_current_lap = 0,
		_laps = {},
	}
	setmetatable(obj, self)
	self.__index = self
	return obj
end
function Stopwatch:state() return self._state end
function Stopwatch:current_lap() return fmt(self._current_lap) end
function Stopwatch:total() return fmt(self._total) end

function Stopwatch:start()
	assert(self._state ~= "running", "cannot start an already running stopwatch")
	self._state = "running"
	self._total = 0
end

function Stopwatch:stop()
	assert(self._state == "running", "cannot stop a stopwatch that is not running")
	self._state = "stopped"
end

function Stopwatch:previous_laps()
	local prev = {}
	for _, l in ipairs(self._laps) do
		table.insert(prev, fmt(l))
	end
	return prev
end

function Stopwatch:reset()
	assert(self._state == "stopped", "cannot reset a stopwatch that is not stopped")
	self._state = "ready"
	self._current_lap = 0
	self._laps = {}
end

function Stopwatch:advance_time(timestamp)
	if self._state == "stopped" then return end
	local h, m, s = timestamp:match("(%d+):(%d+):(%d+)")
	h, m, s = tonumber(h), tonumber(m), tonumber(s)
	self._current_lap = self._current_lap + s + (m * 60) + (h * 60 * 60)
	self._total = self._total + self._current_lap
end

function Stopwatch:lap()
	assert(self._state == "running", "cannot lap a stopwatch that is not running")
	table.insert(self._laps, self._current_lap)
	self._current_lap = 0
end

return Stopwatch
