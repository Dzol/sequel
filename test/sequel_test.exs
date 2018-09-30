defmodule SequelTest do
  use ExUnit.Case
  doctest Sequel

  test "greets the world" do
    assert Sequel.hello() == :world
  end
end
