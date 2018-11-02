if Rails.env == 'test'
  require 'webmock'
  include WebMock::API

  WebMock.allow_net_connect!
end