defmodule LogLevel do
  def to_label(level, legacy?)
  def to_label(0, false), do: :trace
  def to_label(1, _), do: :debug
  def to_label(2, _), do: :info
  def to_label(3, _), do: :warning
  def to_label(4, _), do: :error
  def to_label(5, false), do: :fatal
  def to_label(_, _), do: :unknown

  def alert_recipient(level, legacy?) do
    with level <- to_label(level, legacy?) do
      case {level, legacy?} do
        {:error, _} -> :ops
        {:fatal, _} -> :ops
        {:unknown, true} -> :dev1
        {:unknown, false} -> :dev2
        _ -> nil
      end
    end
  end
end
