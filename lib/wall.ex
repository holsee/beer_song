defmodule BeerBottles.Wall do
  def new do
    {:ok, wall} = start
    wall
  end

  def start do
    Agent.start_link(fn -> [] end)
  end

  def put_on_wall(wall, beers) do
    Agent.get_and_update(wall, fn existing_beers ->
                                 all = existing_beers ++ beers
                                 {Enum.count(all), all}
                               end)
  end

end
