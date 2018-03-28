When(/^I open booking search/) do
  new_menu.open_menu_item(new_menu.booking_search)
  wait_for_assertion(3) do
    expect(visible?(screen, booking_search.booking_search_header)).to eql true
  end
end

And(/^I click booking search button$/) do
  screen.click(booking_search.booking_search_btn)
end

When(/^I select new booking dropdown$/) do
  screen.click(booking_search.new_booking_btn)
end

When(/^I select new arrival booking from new booking dropdown$/) do
  wait_for_assertion(3) do
    expect(visible?(screen, booking_search.new_arrival_booking)).to eql true
  end
  screen.click(booking_search.new_arrival_booking)
end