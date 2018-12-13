class ApplicationController < ActionController::API
  def secret_key

  end

  #given a payload, returns a token
  def encode(payload)
    token = JWT.encode(payload, secret_key, 'HS256')
  end

  #given a token, return the orig payload
  def decode(token)
    JWT.decode(token, secret_key, true, {algorithm: 'HS256'})[0]
  end 


end
