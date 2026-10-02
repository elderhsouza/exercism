defmodule SecretHandshake do
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
      case Bitwise.band(code, 0b00001) do
        0b00001 -> ["wink"]
        _ -> []
      end

    result =
      case Bitwise.band(code, 0b00010) do
        0b00010 -> ["double blink" | result]
        _ -> result
      end

    result =
      case Bitwise.band(code, 0b00100) do
        0b00100 -> ["close your eyes" | result]
        _ -> result
      end

    result =
      case Bitwise.band(code, 0b01000) do
        0b01000 -> ["jump" | result]
        _ -> result
      end

    case Bitwise.band(code, 0b10000) do
      0b10000 -> result
      _ -> Enum.reverse(result)
    end
  end
end
