defmodule SecretHandshake do
  import Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result =
      ((band(code, 1) == 1 && ["wink"]) || []) ++
        ((band(code, 2) == 2 && ["double blink"]) || []) ++
        ((band(code, 4) == 4 && ["close your eyes"]) || []) ++
        ((band(code, 8) == 8 && ["jump"]) || [])

    if band(code, 0b10000) == 0b10000,
      do: Enum.reverse(result),
      else: result
  end
end
