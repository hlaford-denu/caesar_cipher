print "Choose a word : "
word = gets.chomp
new_word = ""
print "Choose a shift factor : "
shift_factor = gets.chomp.to_i

#convert the word to an array"
word_to_array = word.split("")
#convert the alphabet to an array :
#["a", "b", "c", "d", "e", "f", "g", "h", "i", ... "z"]
alphabet = ("a".."z").to_a  

#create a new shifted array (move the letters to the end) :
#["g", "h", "i", "j", "k", "l", "m", "n", ... "f"]

new_alphabet = alphabet.last(25 - shift_factor).concat(alphabet[0..shift_factor]) 

#merge the two arrays to make a "caesar cipher resolution table" using a hash, each letter of the alphabet 
#corresponding to the shifted letter of the table :
# {"a"=>"g", "b"=>"h", "c"=>"i", "d"=>"j", "e"=>"k" ... "z"=>"f"}

caesar_table = new_alphabet.zip(alphabet).to_h

#take each letter of the word and convert it

word_to_array.each do |letter| #for each letter of the word
   if alphabet.include?(letter.downcase) #if the letter is included in the alphabet array shift it
      if letter == letter.upcase #checks if the letter is uppercase
         letter = letter.downcase #then temporarily downcase
         new_word.concat(caesar_table.key(letter).upcase) #compare the downcase letter to the caesar table then put it back uppercase 
      else
         new_word.concat(caesar_table.key(letter)) #if downcase then just shift it
      end
   else
      new_word.concat(letter) #otherwise just copy the character
   end
end

#prints the new word
p new_word
