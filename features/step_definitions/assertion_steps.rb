# frozen_string_literal: true

Then('I should see {string}') do |content|
  expect(page).to have_content content
end

Then('I should see {string} element') do |element|
  expect(page).to have_css element
end

Then("I click the {string} button") do |button|
  click_button button
end

Then("I should see {string} link") do |link|
  expect(page).to have_content link
end

Then("I see the message {string}") do |notice|
  expect(page).to have_css(".notice"), "Welcome! You have signed up successfully."
end

Then("I should not see {string}") do |content|
  expect(page).not_to have_content content
end

Then("I should see {string} within the {string} section") do |content, categories|
  within(:css, '#categories') {
    expect(page).to have_content content 
  }  
end

Given("I click the {string} button within the {int} month subscription section") do |button, payment1|
  within(:css, '#payment1') {
    click_button button
  }
end

Then("I am on the premium articles page") do
  expect(current_path).to eq premium_listings_path
end

Then("I am on the premium article page {string}") do |name|
  article = Article.find_by(title: name)
  expect(current_path).to eq premium_listing_path(article)
end

Then("stop") do
  binding.pry
end

Then("I should see {string} on the {string} article") do |content, content_field|
  article = Article.find_by(title: content_field)
  within("#article_#{article.id}") do
    expect(page).to have_content content
  end
end

Then("I should see {string} within {string} row") do |role_name, email_name|
  user = User.find_by(email: email_name)
  within("#user_#{user.id}") do
    expect(page).to have_content role_name
  end
end

Then("I should be on the main page") do
  expect(current_path).to eq root_path
end

Then("wait {int} second(s)") do |time|
  sleep time
end

Then("I should be on the Subscription page") do
  expect(current_path).to eq new_subscription_path
end

Then("I should be redirected to the landing page") do
  expect(current_path).to eq root_path
end