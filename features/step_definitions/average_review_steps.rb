Then(/^I see the average review of (.*)$/) do |average|
  element = find_by_id("average-rating")
  expect(element).to have_content(average)
end
