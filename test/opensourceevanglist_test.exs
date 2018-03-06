defmodule opensourceevangelistTest do
  use ExUnit.Case
  doctest opensourceevangelist

  test "greets the world" do
    assert opensourceevangelist.hello() == :world
  end
end
