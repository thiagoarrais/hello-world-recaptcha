require 'sinatra'
require 'faraday'
require 'json'

class Webapp < Sinatra::Base
  get '/' do
    "vá para /index.html"
  end
  
  post '/' do
    if recaptcha(params['g-recaptcha-response'], request.ip) then
      <<-HTML
        <html>
          <body>
            #{params['nome']}, eu acho que você não é um robô.
            registrei o email #{params['email']} na minha base de dados!
          </body>
        </html>"
      HTML
    else
      "not ok"
    end
  end
  
  def recaptcha(response_token, ip)
    resp = Faraday.post(
      'https://www.google.com/recaptcha/api/siteverify',
      secret: '6LduABwUAAAAAJ7hscZJjNhlBvkGeFUBTxUezFMa',
      response: response_token,
      remoteip: ip
    )
    result = JSON.parse(resp.body)
    puts "result for #{response_token}"
    p result
    !!result['success']
  end
end