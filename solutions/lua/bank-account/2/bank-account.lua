return {
  new = function(this)
    return setmetatable({
      _balance = 0,
      close = function(self) self._balance = -1 end,
      withdraw = function(self, balance)
        assert(balance > 0 and balance <= self._balance)
        self._balance = self._balance - balance
      end,
      deposit = function(self, balance)
        assert(balance > 0 and self._balance >= 0)
        self._balance = self._balance + balance
      end,
      balance = function(self) return self._balance end,
    }, { __index = this })
  end,
}
