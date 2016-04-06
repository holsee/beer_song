defmodule WallTest do
  use ExUnit.Case, async: false
  use ExCheck

  alias BeerBottles.Wall

  test "can get a wall" do
    wall = Wall.new
    assert is_pid(wall) 
  end


end
