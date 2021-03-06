defmodule PersonTest do
  use ExUnit.Case, async: false
  use ExCheck

  alias BeerBottles.{Person, Beer}

  test "can get another person to drink beer with" do
    person = Person.new
    assert is_pid(person)
  end

  test "can drink some beer" do
    person = Person.new
    beer = Beer.new
    assert :ok == Person.swig(person, beer)
  end

  test "can drink beer and tell us when empty" do
    person = Person.new
    beer = Beer.new
    # assumption beer size 125 and swig size 25
    Person.swig(person, beer)
    Person.swig(person, beer)
    Person.swig(person, beer)
    Person.swig(person, beer)
    Person.swig(person, beer)
    assert :empty == Person.swig(person, beer)
  end

  # TODO: given swig size x, amount drank should be <= beer avilable

  test "can ask person how pissed they are" do
    person = Person.new
    beer = Beer.new
    assert :ok == Person.swig(person, beer)
    assert 25 == Person.how_much_you_drank(person)
  end

  # test "person can pass beer to another person" do
  #   person = Person.new
  #   next_person = Person.new
  #   beer = Beer.new
  #   assert :ok = Person.pass(person, beer, next_person)
  #   assert Person.has_the_beer?(next_person, beer)
  # end

end
