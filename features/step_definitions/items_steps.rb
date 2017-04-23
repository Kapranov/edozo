When(/^I go to the items$/) do
  visit items_path
end

Then(/^I should see title$/) do
  expect(page).to have_content("All the Nested Form by Items")
end
