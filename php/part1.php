<?php

function palindrome($str){
  $str = preg_replace("/\W/", '', $str);
  return strrev(strtolower($str)) == strtolower($str) ? "true" : "false";
}

print palindrome("A man, a plan, a canal -- Panama");  // => true
print "\n";
print palindrome("Madam, I'm Adam!");                  //  => true
print "\n";
print palindrome("Abracadabra");                       // => false (nil is also ok)
print "\n";

function count_words($str){
  $str = preg_split("/\s+/", preg_replace("/\W/", ' ', strtolower($str)));
  $count = Array();
  foreach($str as $word){
  	if (!isset($count[$word])) $count[$word] = 0; 
    $count[$word]+=1;
  }
  return $count;
}

print "\n";
print_r(count_words("A man, a plan, a canal -- Panama"));
// => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
print "\n";
print_r(count_words("Doo bee doo bee doo"));
// => {'doo' => 3, 'bee' => 2}
print "\n";