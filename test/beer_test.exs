defmodule BeerTest do
  use ExUnit.Case, async: false
  use ExCheck

  alias BeerBottles.{Beer, Store}

  test "can create a beer" do
    beer = Beer.new
    assert is_pid(beer)
  end

  test "can take a swig of beer" do
    swig_size = 25
    {:ok, amount} = Beer.new |> Beer.take_swig(25)
    assert amount == swig_size
  end

end
