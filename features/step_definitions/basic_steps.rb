Given("I am on the landing page") do
  visit root_path
end

Given("I am on the article creation page") do
  visit new_admin_article_path
end

Given("I fill in {string} with {string}") do |field, content|
    fill_in field, with: content
end

Given("I click on the {string} button") do |button|
  click_button button
end

Given("I select {string} from {string}") do |option, list|
  select option, from: list
end

Given("the following categories is in the database") do |table|
  table.hashes.each do |category|
    create(:category, category)
  end
end

Given("the following articles are in the database") do |table|
  table.hashes.each do |article_hash|
    category = Category.find_by(name: article_hash[:category])
    article_hash.except!("category")
    create(:article, article_hash.merge(category: category))
  end
end

Given("I click {string}") do |link|
  click_on link
end 

Then("I am on the Sign up page") do
  visit new_user_registration_path
end

Given("I am on the dashboard") do
  visit admin_root_path
end

Given("the following user is registered") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end

Then("I am on the Log in page") do
  visit user_session_path
end

Then("I should see {string} image") do |file_name|
  expect(page).to have_selector "img[src*=`#{file_name}`]"
end

Given("I attach {string}") do |file_name|
  attach_file('article[image]', "#{::Rails.root}/features/support/fixtures/dummy_image.png")
end
