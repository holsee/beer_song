defmodule BeerBottles.Person do
  use GenServer
  require Logger
  alias BeerBottles.Beer

  @swig_size 25

  def new do
    {:ok, person} = start()
    person
  end

  def start do
    GenServer.start(__MODULE__, %{consumed: 0})
  end

  def swig(person, beer) do
    GenServer.call(person, {:swig, beer})
  end

  def how_much_you_drank(person) do
    GenServer.call(person, :how_much_you_drank)
  end

  # GenServer callbacks

  def handle_call({:swig, beer}, _from, %{consumed: so_far} = state) do
    {:ok, consumed} = case Beer.take_swig(beer, @swig_size) do
      {:ok, some_beer} ->
        Logger.info("taking a swig (#{some_beer} ml consumed)")
        {:ok, some_beer}
      :empty ->
        Logger.info("bottle empty, throwing it at a cat")
        # TODO: need to fetch next beer
        {:ok, 0}
    end
    {:reply, :ok, %{state | consumed: so_far + consumed}}
  end

  def handle_call(:how_much_you_drank, _from, %{consumed: so_far} = state) do
    {:reply, so_far, state}
  end

end
