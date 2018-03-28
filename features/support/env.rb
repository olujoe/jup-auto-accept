require 'sikuli'
require 'bsd-jupiter-automation-api/views/desktop'
require 'bsd-jupiter-automation-api/views/media_search'
require 'bsd-jupiter-automation-api/views/favourites'
require 'bsd-jupiter-automation-api/views/video_player'
require 'bsd-jupiter-automation-api/views/booking_search'
require 'bsd-jupiter-automation-api/helpers/step_helper'
require 'bsd-jupiter-automation-api/helpers/wait_helper'
require 'bsd-jupiter-automation-api/menus/new_menu'
require 'bsd-jupiter-automation-api/menus/file_menu'
require 'bsd-jupiter-automation-api/menus/tasks_menu'
require 'bsd-jupiter-automation-api/dialogs/new_arrival_booking'

DEFAULT_WAIT = 10

Sikuli::Config.run do |config|
  config.image_path = "#{Dir.pwd}/features/images/"
  config.logging = true
  config.highlight_on_find = true
end