local BankAccount = { _balance = 0 }

function BankAccount:new()
  local o = setmetatable({}, self)
  self.__index = self
  return o
end

function BankAccount:close()
  self._balance = -1
end

function BankAccount:withdraw(balance)
  if balance <= 0 or balance > self._balance then error("invalid balance") end
  self._balance = self._balance - balance
end

function BankAccount:deposit(balance)
  if balance <= 0 or self._balance < 0 then error("invalid balance") end
  self._balance = self._balance + balance
end

function BankAccount:balance()
  return self._balance
end

return BankAccount
