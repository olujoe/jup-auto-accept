Given(/^I launch Jupiter application/) do
  desktop.start_jupiter
end

Given(/^Jupiter is launched/) do
  if visible?(screen, file_menu.file_menu_btn) == false
    desktop.start_jupiter
    wait_for_assertion(20) do
      expect(visible?(screen, favourites.favourites_lbl)).to eql true
    end
  end
end

Then(/^I should see the following default views after launch$/) do |table|
  wait_for_assertion(20) do
    expect(check_expected_views(table).all? {|view_present| view_present == true}).to eql true
  end
end
