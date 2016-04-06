defmodule BeerBottles.BeerSong do
  use GenServer
  alias BeerBottles.{Beer, Person, Wall}

  @people [Person.new, Person.new, Person.new]

  def start_drinking(count) when is_integer(count) do
     # Find an Offy
     store = Store.new
     # Get the beers in
     beers = Store.buy(store, :beer, count)
     # Get 'em on the wall
     wall = Wall.new
     beers_on_wall = Wall.put_on_wall(wall, beers)
     # Take one down
     {beer, remaining} = Wall.take_one_down(wall)
     # TODO: pass it around (until empty) and sing

     # TODO: Repeat until no more beers

     # TODO: When no more beers, got buy some more

  end

end
