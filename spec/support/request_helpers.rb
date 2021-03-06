module RequestHelpers

  #
  # Dumb glue methods, to deal with rails 4 vs rails 5 get/post methods.
  #
  def do_post(path, *args)
    if Rails::VERSION::MAJOR >= 5
      post path, *args
    else
      post path, *(args.collect{|i| i.values}.flatten)
    end
  end

  def do_get(path, *args)
    if Rails::VERSION::MAJOR >= 5
      get path, *args
    else
      get path, *(args.collect{|i| i.values}.flatten)
    end
  end

# def do_put(path, *args)
#   if Rails::VERSION::MAJOR >= 5
#     put path, *args
#   else
#     put path, *(args.collect{|i| i.values}.flatten)
#   end
# end


  def mock_request(params: {}, cookies: {})
    req = double('request')
    allow(req).to receive(:params).and_return(params)
    allow(req).to receive(:remote_ip).and_return('111.111.111.111')
    allow(req).to receive(:cookie_jar).and_return(cookies)
    req
  end

  def session_cookie_for(user)
    { Authenticate.configuration.cookie_name.freeze.to_sym => user.session_token }
  end
end

RSpec.configure do |config|
  config.include RequestHelpers
end
