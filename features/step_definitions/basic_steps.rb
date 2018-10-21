Given("I am/visit (on )the landing/main page") do
  visit root_path
end

Given("I am on the article creation page") do
  visit new_admin_article_path
end

Given("I fill in {string} with {string}") do |field, content|
    fill_in field, with: content
end

Given("I click {string}") do |button|
  click_button button
end
