Given("I am on the landing page") do
  visit root_path
end
  
Then("I should see {string}") do |expected_content|
    expect(page).to have_content expected_content
end
  
Then("I should see {string} element") do |element|
    expect(page).to have_css element
end

Then("stop") do 
    binding.pry
end
