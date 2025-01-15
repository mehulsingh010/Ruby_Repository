def main
  puts "-------------  Welcome to Hangman Game ! ------------"
  puts " "
  puts "------------- CHOOSE THE LEVEL ------------ "
  puts " "
  puts " 1. LEVEL--1"
  puts " 2. LEVEL--2"
  puts " 3. LEVEL--3"
  puts " 4. LEVEL--4"
  puts " 5. LEVEL--5"
  puts ""

  puts"Words Are Country Name"
  puts" "
  puts "Enter the level you want to choose"
  puts "(Enter the level in number)"
  level_chosen = gets.chomp.to_i

  case level_chosen
  when 1
    puts "LEVEL 1 CHOSEN"
    words = ["usa", "india", "japan", "china", "italy", "spain"]
  when 2
    puts "LEVEL 2 CHOSEN"
    words = ["canada", "brazil", "france", "greece", "mexico", "norway"]
  when 3
    puts "LEVEL 3 CHOSEN"
    words = ["argentina", "portugal", "thailand", "colombia", "finland", "hungary"]
  when 4
    puts "LEVEL 4 CHOSEN"
    words = ["indonesia", "kazakhstan", "switzerland", "philippines", "singapore", "australia"]
  when 5
    puts "LEVEL 5 CHOSEN"
    words = ["liechtenstein", "turkmenistan", "kyrgyzstan", "luxembourg", "uzbekistan", "madagascar"]
  else
    puts "Wrong Entry of Level Code"
    return
  end

  word = words.sample
  guess_word = Array.new(word.length, "_")

  puts "Welcome to Hangman! The word has #{word.length} letters."
  puts " ", guess_word.join(" ")

  changes = 5
  while changes > 0
    puts "Number Of Changes You Have Left: #{changes}"
    print "Enter the character you would like to guess: "
    char = gets.chomp.downcase

    if char.match(/^[a-z]$/)
      if word.include?(char)
        for char_position in 0...word.length
          if char == word[char_position]
            guess_word[char_position] = char
          end
        end
        puts "Guessed character is right: #{char}"
        puts guess_word.join(" ")
      else
        changes -= 1
        puts "Wrong guess! You lost one chance."
      end

      if guess_word.join("") == word
        puts "Congratulations! You guessed the word: #{word}"
        break
      end
    else
      puts "Invalid input! Please enter a single alphabetic character."
    end
  end

  if changes == 0
    puts "Game Over! The word was: #{word}"
  end
end

main

