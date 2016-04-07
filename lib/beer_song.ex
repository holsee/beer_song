defmodule BeerBottles.BeerSong do
  use GenServer
  alias BeerBottles.{Store, Beer, Person, Wall}

  def begin(count) do
    store = Store.new
    wall = Wall.new
    people = [Person.new, Person.new, Person.new]
    goto_the_store_get_some_more(people, store, wall, count)
  end

  def goto_the_store_get_some_more(people, store, wall, count) do
    beers = Store.buy(store, :beer, count)
    Wall.put_on_wall(wall, beers)
    take_one_down_and_pass_it_around(people, store, wall, count)
  end

  def take_one_down_and_pass_it_around(people, store, wall, count) do

    case Wall.take_one_down(wall) do
      {beer, remaining} ->
        :polished_off = pass_it_around(people, beer)
        take_one_down_and_pass_it_around(people, store, wall, count)
      :none ->
        goto_the_store_get_some_more(people, store, wall, count)

    end
  end

  def pass_it_around(people, beer) do
    do_pass_it_around(:ok, people, beer)
  end
  def do_pass_it_around(:ok, [person|rest], beer) do
    do_pass_it_around(Person.swig(person, beer), rest ++ [person], beer)
  end
  def do_pass_it_around(:empty, [person|rest], beer) do
    :polished_off
  end
end
