Given("I am on the landing page") do
  visit root_path
end

Given("I visit the main page") do
  visit root_path
end

Given("I visit the user management page") do
  visit admin_user_management_index_path
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
  expect(page).to have_selector "img[src*='#{file_name}']"
end

Given("I attach {string}") do |file_name|
  attach_file('article[image]', "#{::Rails.root}/spec/fixtures/dummy_image.png")
end

Given("I am signed in as {string}") do |string|
  user = User.find_by(email: string)
  login_as(user)
end

Given("I visit the dashboard") do
  visit admin_root_path
end

Given("I click on {string} article {string} button") do |link_name, link|
  article = Article.find_by(title: link_name)
  within("#article_#{article.id}") do 
    click_on link
  end 
end

Given("I click the {string} checkbox") do |checkbox|
  check checkbox
end

Given("I click {string} button within the {string} section") do |button, section|
  within('#payment1') do
    click_on button
  end
end

Given("I visit the premium articles page") do
  visit premium_listings_path
end

Given("I click on {string} article {string} link") do |link_name, link|
  article = Article.find_by(title: link_name)
  within("#article_#{article.id}") do 
    click_on link
  end 
end

Given("I click on the {string} user {string} button") do |email_name, edit_button|
  user = User.find_by(email: email_name)
  within("#user_#{user.id}") do 
    click_link edit_button    
  end
end

Given("I confirm popup") do
  page.driver.browser.switch_to.alert.accept
end
