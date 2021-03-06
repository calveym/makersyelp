When(/^I go to the (.+)page$/) do |page|
  case page
  when "home"
    visit('/')
  when "restaurant "
    visit('/restaurants/1')
  when "new restaurant "
    visit('/restaurants/new')
  else
    raise "Page doesn't match predefined page names"
  end
end


Given (/^I am signed up$/) do
  visit('/users/sign_up')
  user_sign_up("mjcalvey2@gmail.com", "Password123")
end

Given (/^I am signed in$/) do
  user_sign_in("owner@gmail.com", "Password123")
end

Given (/^([0-9]+) restaurant(s)? exist(s)?$/) do |num_times, i, j|
  user_sign_up("owner@gmail.com", "Password123")
  user_sign_out
  num_times.to_i.times {add_restaurant("Dio's Develish Doner Kebabs #{num_times}",
                          "Bluuuurb of Dio's Develish Kebabs",
                          "desc of doner kebabs",
                          "W1K2SE")}
end

And (/^has reviews with (.+)$/) do |ratings|
  ratings.split(",").map(&:to_i).each do |rating|
    user_sign_up("ab#{rating}@email.com", "password")
    visit '/restaurants/1'
    fill_in_review_form(rating, "comment")
    click_button "Add Review"
    user_sign_out
  end
end


Then(/^I should see a (.*) element with ID "(.*)"$/) do |tag, id|
  element = find_by_id(id.to_s)
  element.assert_matches_selector(tag)
end

And (/^I click the (.*) button$/) do |btn|
  click_button "#{btn}"
end

Then(/^I can see the hardcoded reviews$/) do
  expect(page).to have_text("Bluuuurb of Dio's Develish Kebabs")
end

Then(/^I can modify a restaurant's description$/) do
  fill_in "restaurant_description", with: "where magic food happens"
end

Then(/^I see the new modified changes$/) do
  expect(page).to have_text("where magic food happens")
end
