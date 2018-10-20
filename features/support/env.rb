require 'coveralls'
Coveralls.wear_merged!('rails')
require 'cucumber/rails'
require 'webmock/cucumber'

ActionController::Base.allow_rescue = false
WebMock.allow_net_connect!

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
Cucumber::Rails::Database.javascript_strategy = :truncation
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
WebMock.disable_net_connect!(allow_localhost: true)
Before '@api_call' do 
  WebMock.disable_net_connect!(allow_localhost: true)
  stub_request(:get, "https://newsapi.org/v2/everything?domains=bbc.co.uk&language=en&pageSize=10&q=politics&sources=bbc-news").
  with(
    headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Host'=>'newsapi.org',
      'User-Agent'=>'Ruby',
      'X-Api-Key'=>Rails.application.credentials.news[:api_key]
    }).
  to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'api_response_bbc_politics.txt').read, headers: {})
end