# frozen_string_literal: true

# Base class with common functionality
class BaseGame
  def initialize
    @curr_level = 1
    @guessed_chars = []
    @chances = 5
  end

  def welcome_message
    puts '-------------  Welcome to Hangman Game! ------------'
    puts ''m
    puts "------------- LET'S PLAY! ------------"
    puts ''
  end

  def user_input
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

  def get_user_guess_char
    puts ''
    puts "Number of Chances You Have Left: #{@chances}"
    puts "Characters you have guessed so far: #{@guessed_chars.join(', ')}" unless @guessed_chars.empty?
    print 'Enter the character you would like to guess: '
    gets.chomp.downcase
  end

  def process_guess(char)
    if char.match(/^[a-z]$/)
      if @guessed_chars.include?(char)
        puts "You have already guessed the character '#{char}'. Try a different one."
        return false
      end

      @guessed_chars << char

      if @word.include?(char)
        @word.chars.each_with_index do |w_char, index|
          @guess_word[index] = char if w_char == char
        end
        puts 'Good guess!'
      else
        @chances -= 1
        puts 'Wrong guess! You lost one chance.'
      end

      puts @guess_word.join(' ')
      true
    else
      puts 'Invalid input! Please enter a single alphabetic character.'
      false
    end
  end
end

# HangmanGame inherits from BaseGame
class HangmanGame < BaseGame
  def game_level
    case @curr_level
    when 1
      @words = %w[usa india japan china italy spain]
      @hint = 'The category is: Country.'
    when 2
      @words = %w[apple banana cherry grape mango orange]
      @hint = 'The category is: Fruits.'
    when 3
      @words = %w[elephant giraffe dolphin penguin zebra kangaroo]
      @hint = 'The category is: Animals.'
    when 4
      @words = %w[tokyo paris berlin madrid ottawa canberra]
      @hint = 'The category is: Capital cities.'
    when 5
      @words = %w[galaxy nebula asteroid comet quasar satellite]
      @hint = 'The category is: Space terms.'
    else
      puts 'Invalid Level.'
      return
    end

    start_game
  end

  def start_game
    puts ''
    puts "HINT ----->>  #{@hint}"
    puts ''
    @word = @words.sample
    @guess_word = Array.new(@word.length, '_')
    @guessed_chars = []
    @chances = 5
    puts "The word has #{@word.length} letters."
    puts '', @guess_word.join(' ')
    play_game
  end

  def handle_level_completion
    if @guess_word.join('') == @word
      puts "Congratulations! You guessed the word: #{@word}"
      if @curr_level == 5
        puts "Amazing! You've completed all levels of the Hangman Game. You're a champion!"
        puts 'Thanks for playing! Goodbye!'
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
      end
      return true
    end
    false
  end

  def play_game
    while @chances.positive?
      char = get_user_guess_char
      next unless process_guess(char)
      break if handle_level_completion
    end

    return unless @chances.zero? && !handle_level_completion

    puts "Game Over! The word was: #{@word}"
    exit
  end
end

# Start the game
game = HangmanGame.new
game.welcome_message
game.user_input
