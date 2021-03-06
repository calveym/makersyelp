And(/^I fill out the review fields$/) do
  fill_in_review_form(5, "Lovely")
end

Then(/^I see my review on the page$/) do
  expect(page).to have_content("★★★★★")
  expect(page).to have_content("Lovely")
end

Then(/^I should not see the review button$/) do
  expect(page).not_to have_button('Add Review')
end
