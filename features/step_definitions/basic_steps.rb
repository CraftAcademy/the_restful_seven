Given("I am on the landing page") do
  visit root_path
end

Given("I visit the main page") do
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
  expect(page).to have_selector "img[src*='#{file_name}']"
end

Given("I attach {string}") do |file_name|
  attach_file('article[image]', "#{::Rails.root}/spec/fixtures/dummy_image.png")
end

Given("I am signed is as {string}") do |string|
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

Then("I should see {string} on the {string} article") do |content, content_field|
  article = Article.find_by(title: content_field)
  within("#article_#{article.id}") do
    expect(page).to have_content content
  end
end

Given("I click the {string} checkbox") do |checkbox|
  #find(:css, checkbox).set(true)
  check checkbox
end

Given("I click {string} button within the {string} section") do |button, section|
  within(:css, '#payment1') do
    click_on button
  end
end

Then("I should be on the Subscription page") do
  visit new_subscription_path
end
