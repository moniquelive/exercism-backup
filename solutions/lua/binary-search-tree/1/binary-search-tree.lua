local BinarySearchTree = {}

function BinarySearchTree:new(initial)
  self.__index = self
  return setmetatable({ left = nil, right = nil, value = initial }, self)
end

function BinarySearchTree:from_list(list)
  assert(#list > 0)
  local retval = BinarySearchTree:new(table.remove(list, 1))
  for _, e in ipairs(list) do retval:insert(e) end
  return retval
end

function BinarySearchTree:insert(data)
  if data <= self.value then
    if self.left then self.left:insert(data) else self.left = BinarySearchTree:new(data) end
  else
    if self.right then self.right:insert(data) else self.right = BinarySearchTree:new(data) end
  end
end

function BinarySearchTree:recur()
  if self.left then self.left:recur() end
  coroutine.yield(self.value)
  if self.right then self.right:recur() end
end

function BinarySearchTree:values()
  return coroutine.wrap(function() self:recur() end)
end

return BinarySearchTree
