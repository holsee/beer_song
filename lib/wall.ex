defmodule BeerBottles.Wall do
  def new do
    {:ok, wall} = start
    wall
  end

  def start do
    Agent.start_link(fn -> [] end)
  end


end
