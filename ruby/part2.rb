require 'enumerator'
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)

  unless game.flatten.length == 4
    raise WrongNumberOfPlayersError 
  else
    game.each do |arr|
      raise NoSuchStrategyError unless ['r', 'p', 's'].include? arr[1].downcase 
    end
  end

  win_conditions, fp, sp = {
  	"RS" => 0,	"SR" => 1,
  	"SP" => 0,  "PS" => 1,
  	"PR" => 0,  "RP" => 1
  }, game[0][1], game[1][1]

  if fp == sp
  	game[0]
  else
    game[win_conditions.fetch fp+sp]
  end

end

def rps_tournament_winner tournament
  t = tournament
  while t.flatten.length != 2
    t = t.flatten
    t << rps_game_winner([[t[0],t[1]], [t[2], t[3]]])
    t.shift(4)
  end
  t.flatten
end

test_case = [[[[[[[[["Kelsy", "P"], ["Kanya", "R"]], [["Emyle", "P"], ["Marci", "R"]]], [[["Zarla", "R"], ["Whitney", "S"]], [["Clarissa", "P"], ["Shelbi", "S"]]]], [[[["Melisa", "P"], ["Brook", "P"]], [["Kally", "P"], ["Hedda", "S"]]], [[["Ileana", "R"], ["Lauryn", "S"]], [["Estrella", "S"], ["Bernadine", "P"]]]]], [[[[["Lauri", "R"], ["Henrie", "R"]], [["Wenda", "R"], ["Gretal", "R"]]], [[["Fredericka", "P"], ["Joleen", "R"]], [["Alana", "P"], ["Gladys", "P"]]]], [[[["Candra", "R"], ["Carmel", "S"]], [["Brandy", "P"], ["Mahala", "S"]]], [[["Audie", "P"], ["Mariska", "R"]], [["Kesley", "R"], ["Ursuline", "S"]]]]]], [[[[[["Berni", "P"], ["Brynna", "R"]], [["Jacki", "R"], ["Alix", "R"]]], [[["Kelli", "P"], ["Michal", "S"]], [["Leisha", "P"], ["Dana", "S"]]]], [[[["Carmella", "S"], ["Hester", "P"]], [["Hester", "S"], ["Gerrilee", "P"]]], [[["Moria", "P"], ["Mimi", "P"]], [["Candy", "R"], ["Shel", "R"]]]]], [[[[["Stephi", "S"], ["Emmalee", "P"]], [["Lou", "P"], ["Shaylah", "R"]]], [[["Revkah", "P"], ["Ramonda", "R"]], [["Hanna", "S"], ["Phelia", "S"]]]], [[[["Madelaine", "P"], ["Audy", "R"]], [["Rosetta", "R"], ["Jilly", "R"]]], [[["Kassi", "R"], ["Ellyn", "S"]], [["Leshia", "S"], ["Kathleen", "S"]]]]]]], [[[[[[["Rosella", "P"], ["Ingunna", "S"]], [["Sidonnie", "R"], ["Willie", "P"]]], [[["Collen", "R"], ["Ursuline", "S"]], [["Damara", "P"], ["Pepi", "P"]]]], [[[["Crystal", "S"], ["Ertha", "P"]], [["Mari", "P"], ["Kimbra", "P"]]], [[["Lesley", "P"], ["Starlin", "P"]], [["Bertine", "P"], ["Elsie", "S"]]]]], [[[[["Drucie", "P"], ["Naoma", "S"]], [["Andriette", "R"], ["Nissa", "R"]]], [[["Gerri", "R"], ["Carole", "P"]], [["Jewell", "R"], ["Emilie", "R"]]]], [[[["Chloris", "R"], ["Stacy", "P"]], [["Glynda", "R"], ["Letisha", "S"]]], [[["Amaleta", "P"], ["Jessie", "R"]], [["Jerrine", "S"], ["Tim", "P"]]]]]], [[[[[["Mela", "S"], ["Ruthann", "P"]], [["Charmaine", "R"], ["Ginevra", "S"]]], [[["Kissiah", "S"], ["Selma", "R"]], [["Karalee", "P"], ["Rosemaria", "R"]]]], [[[["Guglielma", "R"], ["Anne-marie", "P"]], [["Cris", "S"], ["Angelle", "S"]]], [[["Danell", "S"], ["Johnna", "S"]], [["Joycelin", "R"], ["Bobbi", "S"]]]]], [[[[["Carilyn", "S"], ["Ainsley", "S"]], [["Margy", "S"], ["Janice", "S"]]], [[["Loria", "P"], ["Trisha", "R"]], [["Pen", "S"], ["Dori", "S"]]]], [[[["Aloysia", "R"], ["Jeana", "S"]], [["Oriana", "R"], ["Waly", "P"]]], [[["Hildegaard", "S"], ["Karoly", "S"]], [["Michele", "P"], ["Lenette", "S"]]]]]]]], [[[[[[[["Emmalynne", "P"], ["Zita", "P"]], [["Elenore", "S"], ["Maighdiln", "P"]]], [[["Hollyanne", "S"], ["Correna", "S"]], [["Adela", "S"], ["Dulsea", "P"]]]], [[[["Cherish", "P"], ["Gaylene", "P"]], [["Lelia", "R"], ["Drona", "S"]]], [[["Kellen", "P"], ["Gael", "R"]], [["Charlotta", "S"], ["Korney", "S"]]]]], [[[[["Babita", "S"], ["Janenna", "R"]], [["Benita", "P"], ["Frayda", "P"]]], [[["Eunice", "P"], ["Bevvy", "P"]], [["Jana", "S"], ["Merna", "S"]]]], [[[["Amandi", "P"], ["Sandi", "P"]], [["Maureen", "P"], ["Rianon", "R"]]], [[["Gayla", "S"], ["Lanie", "P"]], [["Ame", "P"], ["Adel", "R"]]]]]], [[[[[["Rosalinda", "P"], ["Linnea", "S"]], [["Ivonne", "R"], ["Evvie", "R"]]], [[["Sherilyn", "R"], ["Nomi", "P"]], [["Kippy", "P"], ["Kamillah", "P"]]]], [[[["Cristina", "R"], ["Rheba", "R"]], [["Blinni", "S"], ["Carilyn", "R"]]], [[["Reggi", "P"], ["Darcie", "P"]], [["Kaylil", "R"], ["Caroljean", "S"]]]]], [[[[["Shoshanna", "R"], ["Dale", "R"]], [["Lilas", "R"], ["Kalina", "P"]]], [[["Carmine", "P"], ["Melina", "P"]], [["Harriet", "R"], ["Sheryl", "S"]]]], [[[["Patrizia", "R"], ["Calli", "R"]], [["Fenelia", "P"], ["Flor", "P"]]], [[["Melinda", "R"], ["Monica", "S"]], [["Sydel", "P"], ["Amalea", "S"]]]]]]], [[[[[[["Dorotea", "S"], ["Jen", "R"]], [["Louisa", "R"], ["Ladonna", "R"]]], [[["Gerri", "S"], ["Wilie", "P"]], [["Felisha", "P"], ["Dulciana", "R"]]]], [[[["Amabel", "P"], ["Celestine", "S"]], [["Alicea", "S"], ["Ina", "P"]]], [[["Ira", "S"], ["Doll", "S"]], [["Maura", "S"], ["Allyce", "R"]]]]], [[[[["Laina", "R"], ["Sarah", "P"]], [["Elianore", "P"], ["Sidonia", "P"]]], [[["Bel", "S"], ["Maddalena", "S"]], [["Faye", "R"], ["Marlo", "R"]]]], [[[["Alisa", "P"], ["Shandee", "P"]], [["Terrijo", "S"], ["Juliette", "R"]]], [[["Chanda", "R"], ["Timi", "S"]], [["Korry", "P"], ["Natividad", "R"]]]]]], [[[[[["Matti", "R"], ["Audie", "R"]], [["Morissa", "R"], ["Nichol", "R"]]], [[["Melodie", "S"], ["Nettie", "S"]], [["Chicky", "S"], ["Shela", "P"]]]], [[[["Cathi", "R"], ["Augustina", "S"]], [["Yasmin", "R"], ["Dorena", "R"]]], [[["Selestina", "R"], ["Pet", "R"]], [["Judy", "P"], ["Anthia", "S"]]]]], [[[[["Monika", "S"], ["Amandy", "P"]], [["Polly", "R"], ["Claudette", "R"]]], [[["Allix", "P"], ["Billye", "P"]], [["Danika", "P"], ["Demetris", "S"]]]], [[[["Ryann", "R"], ["Cherilyn", "S"]], [["Lynelle", "R"], ["Konstance", "S"]]], [[["Allina", "P"], ["Holly", "S"]], [["Tony", "P"], ["Corella", "R"]]]]]]]]]

p rps_game_winner [ ["Armando", "P"], ["Dave", "S"] ] # dave
p rps_game_winner [ ["Richard", "R"],  ["Michael", "S"] ] #richard
p rps_game_winner [ ["Allen", "S"], ["Omer", "P"] ]#allen
p rps_game_winner [ ["David E.", "R"], ["Richard X.", "P"] ] #richard

p rps_tournament_winner test_case # Michal