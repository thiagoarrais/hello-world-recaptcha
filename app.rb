require 'sinatra'

class Webapp < Sinatra::Base
  get '/' do
    "hello, world!"
  end
end