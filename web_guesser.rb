require "sinatra"
require "sinatra/reloader"

# get '/' do
#   "Hello, World!"
# end

number = rand(100)

get '/' do
"The SECRET NUMBER is #{number}"
end
