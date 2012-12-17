class String
  def sort_by_char
    self.downcase.split(//).sort.join
  end
end

def combine_anagrams(words)
  sorted_arr = []

  words.each do |word|
    sorted_arr << word.sort_by_char
  end
  
  sorted_arr.uniq!
  
  result = []

  sorted_arr.each do |word|
    result << words.select { |w| w.sort_by_char == word }
  end

  result

end



p combine_anagrams ['cArs', 'for', 'potAtoes', 'racs', 'foUr','scar', 'creams', 'scream'] 
puts

p combine_anagrams "catalogue	coagulate
decimate	medicate
exitation	intoxicate
canoe	ocean
englander	greenland
sweat	waste
inapt	paint
observe	verbose
below	elbow
derision	ironside
domino	monoid
dusty	study
bedroom	boredom
meteor	remote".split(' ')

puts
p combine_anagrams "Resistance	Ancestries
Gainly	Laying
Admirer	Married
Sadder	Dreads
Protectional	Lactoprotein
Orchestra	Carthorse
Creative	Reactive
Deductions	Discounted
Listen	Silent
Replays	Parsley
Crudities	Diuretics
Paternal	Parental
Angered	Enraged
Discriminator	Doctrinairism
Serbia	Rabies".split(' ')