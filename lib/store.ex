defmodule BeerBottles.Store do
  use GenServer
  alias BeerBottles.Beer

  def new do
    {:ok, store} = start
    store
  end

  def start do
     GenServer.start(__MODULE__, [])
  end

  def buy(store, :beer, count) when count < 1, do: []
  def buy(store, :beer, count) do
    GenServer.call(store, {:buy_beer, count})
  end

  # GenServer callbacks

  def handle_call({:buy_beer, count}, _from, state) do
    beers = Enum.map(1..count, fn _ -> Beer.new end)
    {:reply, beers, state}
  end

end
