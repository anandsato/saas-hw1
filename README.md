# BerkeleyX: CS169.1x Software as a Service - Homework # 1

## HW 1-1: FUN WITH STRINGS

In this problem, you are asked to implement two functions that perform basic string processing. You can get the template file for this problem [here](https://www.edx.org/static/content-berkeley-cs169x~2012_Fall/handouts/hw1.44ef4bb1aa7b.zip) (the file for this problem is "part1.rb"). Please read the instructions carefully and submit your code via the "Browse" button at the bottom of the page.

**Part A — Palindromes**: Write a method __palindrome?(string)__ that determines whether a given string (word or phrase) is a palindrome, that is, it reads the same backwards as forwards, ignoring case, punctuation, and nonword characters. (A "nonword character" is defined for our purposes as "a character that Ruby regexps would treat as a nonword character".)

Your solution shouldn't use loops or iteration of any kind. Instead, you will find regular-expression syntax very useful; it's reviewed briefly in the book, and the website [rubular.com](http://www.rubular.com/) lets you try out Ruby regular expressions "live". Some methods that you might find useful (which you'll have to look up in Ruby documentation, [ruby-doc.org](http://ruby-doc.org/)) include: __String#downcase__, __String#gsub__, __String#reverse__.

**Part B — Word Count**: Define a function __count_words(string)__ that, given an input string, return a hash whose keys are words in the string and whose values are the number of times each word appears. Your code should look like:

Your solution shouldn't use for-loops, but iterators like each are permitted. As before, nonwords and case should be ignored. A word is defined as a string of characters between word boundaries. (Hint: the sequence "\b" in a Ruby regexp means "word boundary".)

## HW 1-2: ROCK-PAPER-SCISSORS
In a game of rock-paper-scissors (RPS), each player chooses to play Rock (R), Paper (P), or Scissors (S). The rules are: R beats S; S beats P; and P beats R. We will encode a rock-paper-scissors game as a list, where the elements are themselves 2-element lists that encode a player's name and a player's selected move, as shown below:

> [ ["Armando", "P"], ["Dave", "S"] ] # Dave would win since S > P

**Part A**: Write a method rps_game_winner that takes a two-element list and behaves as follows:
- If the number of players is not equal to 2, raise __WrongNumberOfPlayersError__.
- If either player's strategy is something other than "R", "P" or "S" (case-insensitive), raise __NoSuchStrategyError__.
- Otherwise, return the name and move of the winning player. If both players play the same move, the first player is the winner.

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

Hint: You can quickly tell if two words are anagrams by sorting their letters, keeping in mind that upper vs. lowercase doesn't matter.

## HW 1-4: BASIC OBJECT ORIENTED PROGRAMMING
**Part A**: Create a class Dessert with getters and setters for name and calories. Define instance methods healthy?, which returns true if a dessert has less than 200 calories, and delicious? which returns true for all desserts.

Note: You may define additional helper methods.

**Part B**: Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. Modify delicious? to return false if the flavor is "black licorice" (but delicious? should still return true for all other flavors and for all non-JellyBean desserts).

Note: As before, you may define additional helper methods.

## HW 1-5: ADVANCED OOP, METAPROGRAMMING, OPEN CLASSES AND DUCK TYPING
In lecture, we saw how attr_accessor uses metaprogramming to create getters and setters for object attributes on the fly.

Define a method attr_accessor_with_history that provides the same functionality as attr_accessor but also tracks every value the attribute has ever taken.

Here are some hints and guidelines to get you rolling:

- The first thing to notice is that if we define attr_accessor_with_history in class Class, we can use it as in the snippet above. This is because, as ELLS mentions, a class in Ruby is simply an object of class Class. (If that makes your brain hurt, don't worry about it for now. It'll come eventually.)

- The second thing to notice is that Ruby provides a method class_eval that takes a string and evaluates it in the context of the current class, that is, the class from which you're calling attr_accessor_with_history. This string will need to contain a method definition that implements a setter-with-history for the desired attribute attr_name.

- __bar_history__ should always return an Array of elements, even if no values have been assigned yet.

- Don't forget that the very first time the attribute receives a value, its history array will have to be initialized.

- Don't forget that instance variables are referred to as @bar within getters and setters, as explained in Section 3.4 of ELLS.

- Although the existing attr_accessor can handle multiple arguments (e.g. attr_accessor :foo, :bar), your version just needs to handle a single argument. However, it should be able to track multiple instance variables per class, with any legal class names or variable names.

- History of instance variables should be maintained separately for each object instance.

## HW 1-6: ADVANCED OOP, METAPROGRAMMING, OPEN CLASSES AND DUCK TYPING
**Part A** — Currency conversion (ELLS 3.11): Extend the currency-conversion example from lecture so that code such as the following will work:
- 5.dollars.in(:euros)
- 10.euros.in(:rupees)

You should support the currencies dollars, euros, rupees, yen where the conversions are:
- rupees to dollars, multiply by 0.019,
- yen to dollars, multiply by 0.013,
- euro to dollars, multiply by 1.292.

Both the singular and plural forms of each currency should be acceptable, e.g. 1.dollar.in(:rupees) and 10.rupees.in(:euro) should work.

**Part B** — Palindromes: Adapt your solution from the "palindromes" question so that instead of writing palindrome?("foo") you can write "foo".palindrome? (Hint: this should require fewer than 5 lines of code.)

**Part C** — Palindromes again: Adapt your palindrome solution so that it works on Enumerables.

It's not necessary for the collection's elements to be palindromes themselves--only that the top-level collection be a palindrome. (Hint: this should require fewer than 5 lines of code.) Although hashes are considered Enumerables, your solution does not need to work with hashes, though it should not error.

## HW 1-7: ITERATORS, BLOCKS, YIELD
Given two collections (of possibly different lengths), we want to get the Cartesian product of the sequences. A Cartesian product is a sequence that enumerates every possible pair from the two collections, where the pair consists of one element from each collection. 

Create a constructor for the class CartesianProduct that that takes two sequences as arguments, these values will define the behavior of your object. Define each as an instance method for CartesianProduct. Your method should return an iterator which yields the cartesian product of the two sequences used in the class' constructor. The iterator should yield the values one at a time as 2 element arrays.

# Disclaimer
These homework are meant to test the student's understanding of the material in the Course. While I doubt the answers will be of any use since the course is already over, I hope the same problems won't be used the next time it'll be offered by edX. Eitherway, the course was a fun learning experience. :bowtie: