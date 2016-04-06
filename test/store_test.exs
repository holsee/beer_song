defmodule BeerBottles.StoreTest do
  use ExUnit.Case, async: false
  use ExCheck

  alias BeerBottles.Store

  test "can create a store" do
    store = Store.new
    assert is_pid(store) 
  end

  property :can_buy_beer_from_store do
    store = Store.new

    for_all x in int(0,1000) do
      beers = Store.buy(store, :beer, x)
      Enum.count(beers) == x
    end
  end

end
