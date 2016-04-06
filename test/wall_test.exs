defmodule WallTest do
  use ExUnit.Case, async: false
  use ExCheck

  alias BeerBottles.{Wall, Store}

  test "can get a wall" do
    wall = Wall.new
    assert is_pid(wall)
  end

  test "can take one down for passing around" do
    beers = Store.new |> Store.buy(:beer, 99)
    wall = Wall.new
    Wall.put_on_wall(wall, beers)

    {beer, remaining} = Wall.take_one_down(wall)
    assert is_pid(beer)
    assert 98 == remaining
  end

  property "can put beers on the wall" do
    store = Store.new

    for_all x in int(0,100) do
      beers = Store.buy(store, :beer, x)
      wall = Wall.new
      beer_on_wall_count = Wall.put_on_wall(wall, beers)
      beer_on_wall_count == Enum.count(beers)
    end
  end

end
