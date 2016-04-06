defmodule BeerTest do
  use ExUnit.Case, async: false
  use ExCheck

  alias BeerBottles.{Beer, Store}

  test "can create a beer" do
    beer = Beer.new
    assert is_pid(beer)
  end

end
