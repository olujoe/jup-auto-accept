Then(/^New arrival booking dialog should open$/) do
  wait_for_assertion(3) do
    expect(visible?(screen, new_arrival_booking_dialog.dialog_lbl)).to eql true
  end
end

Then(/^the following should be present in new arrival booking dialog/) do |table|
  wait_for_assertion(20) do
    expect(check_expected_views(table).all? {|view_present| view_present == true}).to eql true
  end
end

Given(/^Arrival booking dialog is open$/) do
  new_menu.open_menu_item(new_menu.arrival_booking)
  wait_for_assertion(5) do
    expect(visible?(screen, new_arrival_booking_dialog.dialog_lbl)).to eql true
  end
end

Given(/^both story and detail fields are left blank$/) do
  wait_for_assertion(5) do
    expect(visible?(screen, new_arrival_booking_dialog.story_field)).to eql true
    expect(visible?(screen, new_arrival_booking_dialog.description_field)).to eql true
  end
end

When(/^Arrival booking OK button is clicked$/) do
  wait_for_assertion(5) do
    expect(visible?(screen, new_arrival_booking_dialog.ok_btn)).to eql true
  end
  screen.click(new_arrival_booking_dialog.ok_btn)
end

Then(/^Booking error alert is displayed$/) do
  wait_for_assertion(5) do
    expect(visible?(screen, new_arrival_booking_dialog.booking_error_alert)).to eql true
  end
end

Then(/^Arrival booking dialog can be closed via Cancel ctrl$/) do
  screen.click(new_arrival_booking_dialog.cancel_btn)
  wait_for_assertion(5) do
    expect(visible?(screen, new_arrival_booking_dialog.dialog_lbl)).to eql false
  end
end

Then(/^Arrival booking dialog can be closed via System Close ctrl$/) do
  screen.click(new_arrival_booking_dialog.close_btn)
  wait_for_assertion(5) do
    expect(visible?(screen, new_arrival_booking_dialog.dialog_lbl)).to eql false
  end
end
