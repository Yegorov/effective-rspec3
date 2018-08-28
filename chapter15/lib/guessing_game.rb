class GuessingGame
  attr_writer :stdout

  def play(number: rand(1..100))
    @number = number
    @guess = nil

    5.downto(1) do |ramaining_guesses|
      break if @guess == @number
      stdout.puts "Pick a number 1-100 (#{ramaining_guesses} guesses left):"
      @guess = gets.to_i
      check_guess
    end

    announce_result
  end

  def stdout
    @stdout ||= $stdout
  end

  private
  def check_guess
    if @guess > @number
      stdout.puts "#{@guess} is too high!"
    elsif @guess < @number
      stdout.puts "#{@guess} is too low!"
    end
  end

  def announce_result
    if @guess == @number
      stdout.puts 'You won!'
    else
      stdout.puts "You lost! The number was: #{@number}"
    end
  end
end

GuessingGame.new.play if __FILE__.end_with?($PROGRAM_NAME)
