# BerkeleyX: CS169.1x Software as a Service - Homework # 1

## HW 1-1: FUN WITH STRINGS

In this problem, you are asked to implement two functions that perform basic string processing. You can get the template file for this problem [here](https://www.edx.org/static/content-berkeley-cs169x~2012_Fall/handouts/hw1.44ef4bb1aa7b.zip) (the file for this problem is "part1.rb"). Please read the instructions carefully and submit your code via the "Browse" button at the bottom of the page.

**Part A — Palindromes**: Write a method __palindrome?(string)__ that determines whether a given string (word or phrase) is a palindrome, that is, it reads the same backwards as forwards, ignoring case, punctuation, and nonword characters. (A "nonword character" is defined for our purposes as "a character that Ruby regexps would treat as a nonword character".)

The structure of your code should look as follows:
> def palindrome?(string)
>
>    # your code here
>
> end

Your solution shouldn't use loops or iteration of any kind. Instead, you will find regular-expression syntax very useful; it's reviewed briefly in the book, and the website [rubular.com](http://www.rubular.com/) lets you try out Ruby regular expressions "live". Some methods that you might find useful (which you'll have to look up in Ruby documentation, [ruby-doc.org](http://ruby-doc.org/)) include: __String#downcase__, __String#gsub__, __String#reverse__.

Example test cases:
> palindrome?("A man, a plan, a canal -- Panama")  # => true
>
> palindrome?("Madam, I'm Adam!")                  # => true
>
> palindrome?("Abracadabra")                       # => false (nil is also ok)

**Part B — Word Count**: Define a function __count_words(string)__ that, given an input string, return a hash whose keys are words in the string and whose values are the number of times each word appears. Your code should look like:

> def count_words(string)
>
>   # your code here
>
> end

Your solution shouldn't use for-loops, but iterators like each are permitted. As before, nonwords and case should be ignored. A word is defined as a string of characters between word boundaries. (Hint: the sequence "\b" in a Ruby regexp means "word boundary".)

Example test cases:
> count_words("A man, a plan, a canal -- Panama")
>
>    # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
>
> count_words "Doo bee doo bee doo"
>
>    # => {'doo' => 3, 'bee' => 2}

## HW 1-2: ROCK-PAPER-SCISSORS
In a game of rock-paper-scissors (RPS), each player chooses to play Rock (R), Paper (P), or Scissors (S). The rules are: R beats S; S beats P; and P beats R. We will encode a rock-paper-scissors game as a list, where the elements are themselves 2-element lists that encode a player's name and a player's selected move, as shown below:

> [ ["Armando", "P"], ["Dave", "S"] ] # Dave would win since S > P

**Part A**: Write a method rps_game_winner that takes a two-element list and behaves as follows:
- If the number of players is not equal to 2, raise __WrongNumberOfPlayersError__.
- If either player's strategy is something other than "R", "P" or "S" (case-insensitive), raise __NoSuchStrategyError__.
- Otherwise, return the name and move of the winning player. If both players play the same move, the first player is the winner.

We'll get you started:
> class WrongNumberOfPlayersError <  StandardError ; end
> 
> class NoSuchStrategyError <  StandardError ; end
> 
> def rps_game_winner(game)
>
>   raise WrongNumberOfPlayersError unless game.length == 2
> 
>   # your code here
> 
> end

**Part B**: We will define a rock-paper-scissors tournament to be an array of games in which each player always plays the same move. A rock-paper-scissors tournament is encoded as a bracketed array of games:
> [
>   [
> 
>       [ ["Armando", "P"], ["Dave", "S"] ],
> 
>       [ ["Richard", "R"],  ["Michael", "S"] ],
> 
>   ],
> 
>   [
> 
>       [ ["Allen", "S"], ["Omer", "P"] ],
> 
>       [ ["David E.", "R"], ["Richard X.", "P"] ]
> 
>   ]
> ]


In the tournament above Armando will always play P and Dave will always play S. This tournament plays out as follows:
- Dave would beat Armando (S>P),
- Richard would beat Michael (R>S), and then
- Dave and Richard would play (Richard wins since R>S).

Similarly,
- Allen would beat Omer,
- Richard X would beat David E., and
- Allen and Richard X. would play (Allen wins since S>P).

Finally,
- Richard would beat Allen since R>S.
- Note that the tournament continues until there is only a single winner.

Tournaments can be nested arbitrarily deep, i.e., it may require multiple rounds to get to a single winner. You can assume that the initial tournament is well-formed (that is, there are 2^n players, and each one participates in exactly one match per round).

Write a method __rps_tournament_winner__ that takes a tournament encoded as a bracketed array and returns the winner (for the above example, it should return ["Richard", "R"]).


## HW 1-3: ANAGRAMS
An anagram is a word obtained by rearranging the letters of another word. For example, "rats", "tars", and "star" are anagrams of one another, as are "dictionary" and "indicatory". We will call any array of single-word anagrams an anagram group. For instance, ["rats", "tars", "star"] is an anagram group, as is ["dictionary"].

Write a method __combine_anagrams(words)__ that, given an array of strings words, groups the input words into anagram groups. Case doesn't matter in classifying strings as anagrams (but case should be preserved in the output), and the order of the anagrams in the groups doesn't matter. The output should be an array of anagram groups (i.e. an array of arrays).

Code skeleton:
> def combine_anagrams(words)
>
>    # your code here
>
> end

Example test case:
> # input: ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] 
>
> # output: [ ["cars", "racs", "scar"],
>
> #           ["four"],
>
> #           ["for"],
>
> #           ["potatoes"],
>
> #           ["creams", "scream"] ]

Hint: You can quickly tell if two words are anagrams by sorting their letters, keeping in mind that upper vs. lowercase doesn't matter.