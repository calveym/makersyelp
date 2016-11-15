When (/^I go to the add form page$/) do
  visit 'restaurants/new'
end

Then(/^I can a see form with name, blurb and description fields$/) do
  expect(page).to have_field("restaurant[name]")
  expect(page).to have_field("restaurant[blurb]")
  expect(page).to have_field("restaurant[description]")
  expect(page).to have_button("Add Restaurant")
end