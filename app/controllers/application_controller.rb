class ApplicationController < ActionController::API
  def secret_key
      'h3llo'
  end

  #given a payload, returns a token
  def encode(payload)
    token = JWT.encode(payload, secret_key, 'HS256')
  end

  #given a token, return the orig payload
  def decode(token)
    JWT.decode(token, secret_key, true, {algorithm: 'HS256'})[0]
  end

  def current_user
    headers = request.headers['Authentication']
    if headers != nil
    token = headers.split(' ')[1]
    payload = decode(token)
    current_user = User.find(payload["user"])
    return current_user
    end
    return nil
  end


end
