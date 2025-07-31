defmodule NameBadge do
  def print(nil, name, department),
    do: ~s(#{name} - #{String.upcase(department || "owner")})

  def print(id, name, department),
    do: "[#{id}] - #{print(nil, name, department)}"
end
