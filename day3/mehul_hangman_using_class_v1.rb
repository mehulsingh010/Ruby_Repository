# frozen_string_literal: true

class HangmanGame
  def initialize
    @curr_level = 1
    puts '-------------  Welcome to Hangman Game! ------------'
    puts ''
    puts "------------- LET'S PLAY! ------------"
    puts ''
    
    puts ''
    puts 'Do You Want to Play?'
    print "Enter 'yes' to play or 'no' to exit: "
    puts ''
    user_choice = gets.chomp.downcase

    if user_choice == 'yes'
      game_level
    else
      puts 'You exited the game. Goodbye!'
    end
  end

  def game_level
    case @curr_level
    when 1
      words = %w[usa india japan china italy spain]
      hint = 'The category is: Country .'
    when 2
      words = %w[apple banana cherry grape mango orange]
      hint = 'The category is: Fruits.'
    when 3
      words = %w[elephant giraffe dolphin penguin zebra kangaroo]
      hint = 'The category is: Animals.'
    when 4
      words = %w[tokyo paris berlin madrid ottawa canberra]
      hint = 'The category is: Capital cities.'
    when 5
      words = %w[galaxy nebula asteroid comet quasar satellite]
      hint = 'The category is: Space terms.'
    else
      puts 'Wrong Entry of Level Code'
      return
    end

    puts ""
    puts "HINT ----->>  #{hint} "
    puts ""
    @word = words.sample
    @guess_word = Array.new(@word.length, '_')
    @guessed_chars = [] # Initialize an empty array to track guessed characters
    puts "The word has #{@word.length} letters."
    puts ' ', @guess_word.join(' ')
    main_game
  end

  def main_game
    changes = 5
    while changes > 0
      puts ''
      puts "Number Of Chances You Have Left: #{changes}"
      puts "Characters you have guessed so far: #{@guessed_chars.join(', ')}" unless @guessed_chars.empty?
      print 'Enter the character you would like to guess: '
      char = gets.chomp.downcase

      if char.match(/^[a-z]$/)
        if @guessed_chars.include?(char)
          puts "You have already guessed the character '#{char}'. Try a different one."
          next
        end

        @guessed_chars << char # Add the character to the guessed list

        if @word.include?(char)
          @word.chars.each_with_index do |w_char, index|
            @guess_word[index] = char if w_char == char
          end
          puts "Guessed character is right: #{char}"
          puts @guess_word.join(' ')
          puts ''
        else
          changes -= 1
          puts 'Wrong guess! You lost one chance.'
        end

        if @guess_word.join('') == @word
          puts "Congratulations! You guessed the word: #{@word}"
          if @curr_level == 5
            puts "Amazing! You've completed all levels of the Hangman Game. You're a champion!"
            puts 'Thanks for playing! Goodbye!'
            return
          else
            @curr_level += 1
            puts ''
            print 'Do you want to continue to the next level? (yes/no): '
            continue = gets.chomp.downcase
            if continue == 'yes'
              game_level
            else
              puts 'Thanks for playing! Goodbye!'
            end
            return
          end
        end
      else
        puts 'Invalid input! Please enter a single alphabetic character.'
      end
    end

    puts "Game Over! The word was: #{@word}" if changes.zero?
  end
end

# Start the game
HangmanGame.new

