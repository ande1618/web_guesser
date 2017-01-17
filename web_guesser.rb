require "sinatra"
require "sinatra/reloader"

# get '/' do
#   "Hello, World!"
# end


  NUMBER = rand(100)
  instruction = "Guess a secret number between 0 and 100!"

  get '/' do
      guess = params['guess'].to_i
    	message = check_guess(guess)
      background = check_color(message)
    erb :index, :locals => {:number => NUMBER, :message => message, :guess => guess, :instruction => instruction, :background => background}
  end

  def check_guess(guess)
      if guess.to_i > NUMBER + 5
        message =  "Way too high!"
      elsif guess.to_i < NUMBER - 5
        message = "Way too low!"
      elsif guess.to_i > NUMBER
        message = "Too high!"
      elsif guess.to_i < NUMBER
        message = "Too low!"
      else guess.to_i == NUMBER
        return "The SECRET NUMBER is #{NUMBER}"
      end
  end

  def check_color(message)
    case message
      when message = "Way too high!"
        background = '#FE0101'
      when message = "Way too low!"
        background = '#FE0101'
      when message = "Too high!"
        background = '#FB9F9F'
      when message = "Too low!"
        background = '#FB9F9F'
      when message = "The SECRET NUMBER is #{NUMBER}"
        background = '#1EDC44'
      else
        background = '#FFFFFF'
    end
  end
