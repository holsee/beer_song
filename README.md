# BeerBottles Kata

http://www.99-bottles-of-beer.net/

OTP Style with excheck


"
99 bottles of beer on the wall, 99 bottles of beer.
 Take one down and pass it around, 98 bottles of beer on the wall."

 ...

 1 bottle of beer on the wall, 1 bottle of beer.
 Take one down and pass it around, no more bottles of beer on the wall.

 No more bottles of beer on the wall, no more bottles of beer.
 Go to the store and buy some more, 99 bottles of beer on the wall.
"

Each explicit actor has been modeled as a process.

- Each **Beer** is a process
- The **Store** is a process, that sells Beer
- The **Wall** will hold the Beers
- Each **Person** who is drinking the beer is a process

The lyrics of the song are enacted by the processes communicating with each other.

Notes:

- Each beer holds it volume
- Each person holds the quantity of beer they each consumed
- This will run in a infinite loop unless you comment out the call which makes the recursive loop:

beer_song.ex
```
24 :none ->
25  goto_the_store_get_some_more(people, store, wall, count) # comment out to prevent infinite binging
26  #:go_home # uncomment to do single run
```

Compile:

```
mix do deps.get, compile
```

Test:

```
mix test
```

Run:

open iex session
```
iex -S mix
```

let the drinking begin
``` elixir
num_beers_before_getting_more 99
BeerBottles.BeerSong.begin num_beers_before_getting_more
```
