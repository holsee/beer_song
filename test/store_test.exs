defmodule BeerBottles.StoreTest do
  use ExUnit.Case, async: false
  use ExCheck

  alias BeerBottles.Store

  test "can create a store" do
    store = Store.new
    assert is_pid(store)
  end

  property "can buy beer from store" do
    store = Store.new

    for_all x in int(0,500) do
      beers = Store.buy(store, :beer, x)
      Enum.count(beers) == x
    end
  end

  property "can ask for negative amount of beer but wont get any" do
    store = Store.new

    for_all x in int do
      implies x < 0 do
        beers = Store.buy(store, :beer, x)
        Enum.count(beers) == 0
      end
    end
  end

end
