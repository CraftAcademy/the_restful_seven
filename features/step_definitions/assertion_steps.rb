# frozen_string_literal: true

Then('I should see {string}') do |content|
  expect(page).to have_content content
end

Then('I should see {string} element') do |element|
  expect(page).to have_css element
end

Then("I see the message {string}") do |notice|
  expect(page).to have_css(".notice"), "Welcome! You have signed up successfully."
end