Given(/^I select the new menu$/) do
  new_menu.open_menu
end

Then(/^I should see arrival booking option in menu list$/) do
  wait_for_assertion(3) do
    expect(visible?(screen, new_menu.arrival_booking)).to eql true
  end
end

When(/^I select new arrival booking menu item$/) do
  screen.click(new_menu.arrival_booking)
end

Given(/^I select the tasks menu$/) do
  tasks_menu.open_menu
end

Given(/^I expand 'New' tree item$/) do
  tasks_menu.expand_view
end
