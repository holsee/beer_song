defmodule BeerBottles.Beer do
  use GenServer

  @bottle_size 125

  def new do
    {:ok, beer} = start()
    beer
  end

  def start do
    GenServer.start(__MODULE__, %{beer: @bottle_size})
  end

  def take_swig(beer, swig_size) do
    GenServer.call(beer, {:take_swig, swig_size})
  end

  def handle_call({:take_swig, swig_size}, _from, %{beer: beer} = state)
    when beer > 0 and swig_size <= beer do
    {:reply, {:ok, swig_size}, %{state | beer: beer - swig_size}}
  end
  # def handle_call({:take_swig, swig_size}, _from, %{beer: beer} = state)
  #   when beer > 0 and swig_size > beer do
  #
  #   {:reply, {:ok, 25}, %{state | beer: beer - 25}}
  # end
  def handle_call({:take_swig, swig_size}, _from, %{beer: 0} = state) do
    {:reply, :empty, state}
  end

end
