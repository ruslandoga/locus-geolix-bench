defmodule B do
  @moduledoc """
  Documentation for `B`.
  """

  import Bitwise

  def rand_ipv4 do
    ipv4 = :rand.uniform(4_294_967_296)
    decode_unsigned(ipv4)
  end

  def decode_unsigned(ipv4) when is_integer(ipv4) do
    a = ipv4 >>> 24
    rest = ipv4 - (a <<< 24)
    b = rest >>> 16
    rest = rest - (b <<< 16)
    c = rest >>> 8
    d = rest - (c <<< 8)
    "#{a}.#{b}.#{c}.#{d}"
  end
end
