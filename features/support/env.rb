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
Cucumber::Rails::Databse.javascript_strategy = :truncation
WebMock.disable_net_connect!(allow_localhost: true)
Before do
  stub_request(:get, https://newsapi.org/v2/everything?q=bitcoin&apiKey=62aeaa7f151d4e21a0d8bcc6032044ea ).
  with(
    headers: {
      'Accept'=>'*/*',
      'Accept-Edcoding'=>'gzip, deflate',
    }
  )
end
