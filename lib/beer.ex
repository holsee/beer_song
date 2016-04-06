defmodule BeerBottles.Beer do
  use GenServer

  def new do
    {:ok, beer} = start()
    beer
  end

  def start do
    GenServer.start(__MODULE__, [])
  end

end
