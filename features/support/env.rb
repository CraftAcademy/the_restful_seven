require 'coveralls'
Coveralls.wear_merged!('rails')
require 'cucumber/rails'
require 'webmock/cucumber'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation

WebMock.allow_net_connect!
Chromedriver.set_version '2.36' unless ENV['CI'] == 'true'


chrome_options = %w(no-sandbox disable-popup-blocking disable-infobars)
chrome_options << 'headless' if ENV['CI'] == 'true'

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
          args: chrome_options
      }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.server = :puma
Capybara.javascript_driver = :chrome

World(FactoryBot::Syntax::Methods)
Before '@api_call' do 
  WebMock.disable_net_connect!(allow_localhost: true)
  stub_request(:get, /newsapi.org/v2/).
  with(
    headers: {
	  'Accept'=>'*/*',
	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
	  'Host'=>'newsapi.org',
	  'User-Agent'=>'Ruby',
	  'X-Api-Key'=>'62aeaa7f151d4e21a0d8bcc6032044ea'
    }).
    to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'api_landing_page_latest_news.txt').read, headers: {})
  # stub_request(:get, "https://newsapi.org/v2/everything?domains=bbc.co.uk&language=en&pageSize=10&q=general&sources=bbc-news").
  #   with(
  #     headers: {
  #     'Accept'=>'*/*',
  #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
  #     'Host'=>'newsapi.org',
  #     'User-Agent'=>'Ruby',
  #     'X-Api-Key'=>'62aeaa7f151d4e21a0d8bcc6032044ea'
  #   }).
  #   stub_request(:get, "https://newsapi.org/v2/everything?domains=bbc.co.uk&language=en&pageSize=10&q=general&sources=bbc-news").
end

Before '@api_category_call' do 
  WebMock.disable_net_connect!(allow_localhost: true)
  stub_request(:get, "https://newsapi.org/v2/everything?domains=bbc.co.uk&language=en&pageSize=10&q=business&sources=bbc-news").
  with(
    headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'newsapi.org',
      'User-Agent'=>'Ruby',
      'X-Api-Key'=>Rails.application.credentials.news[:api_key]
    }).
    to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'api_response_category_business_call.txt').read, headers: {})
end
