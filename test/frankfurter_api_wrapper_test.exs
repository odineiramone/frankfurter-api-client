defmodule FrankfurterApiWrapperTest do
  use ExUnit.Case
  doctest FrankfurterApiWrapper

  test "greets the world" do
    assert FrankfurterApiWrapper.hello() == :world
  end
end
