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
  erb :index, :locals => {:number => NUMBER, :message => message, :guess => guess, :instruction => instruction}
end

def check_guess(guess)
    # if guess.to_i == 0
    #   return "Guess a secret number between 0 and 100!"
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
