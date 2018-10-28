Then("I fill in the Stripe form") do
  srtipe_iframe = find("iframe[name='__privateStripeFrame3']")
  within_frame srtipe_iframe do
    find_field('cardnumber').send_keys('4242424242424242')
    find_field('exp-date').send_keys('0922')
    find_field('cvc').send_keys('567')
  end
end