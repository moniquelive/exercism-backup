defmodule NameBadge do
  def print(id, name, department) do
    prefix = if id == nil, do: "", else: "[#{id}] - "
    department = if department == nil, do: "owner", else: department
    prefix <> "#{name} - #{String.upcase(department)}"
  end
end
