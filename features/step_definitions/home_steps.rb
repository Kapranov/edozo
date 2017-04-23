When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the demo title$/) do
  expect(page).to have_content("Demo")
end
