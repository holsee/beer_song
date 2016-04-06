defmodule BeerTest do
  use ExUnit.Case, async: false
  use ExCheck

  alias BeerBottles.Beer

  test "can create a beer" do
    store = Beer.new
    assert is_pid(store)
  end

end
