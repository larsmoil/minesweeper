

Given /^a board with a (\d+) by (\d+)$/ do |columns, rows|
  Board.new(columns, rows)
end

Given /^the mines are placed as following:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

When /^I show the board$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end