Given(/^I am on page of the projects$/) do
  visit projects_path
end

Given(/^I go to "(.*?)"$/) do |the_link|
  click_link the_link
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |input, value|
  fill_in input, with: value
end

When(/^I press "Create Project"$/) do
  click_on('Create Project')
end

Then(/^I should see "My first project!"$/) do
  expect(page).to have_content('My first project!')
end
