
# Sikuli view (screen is default region)
def screen
  @screen ||= Sikuli::Screen.new
end

# Desktop i.e working VM or Monitor
def desktop
  @desktop ||= BsdJupiterAutomationApi::Desktop.new(screen)
end

def media_search
  @media_search ||= BsdJupiterAutomationApi::MediaSearch.new(screen)
end

def favourites
  @favourites ||= BsdJupiterAutomationApi::Favourites.new(screen)
end

def booking_search
  @booking_search ||= BsdJupiterAutomationApi::BookingSearch.new(screen)
end

def video_player
  @video_player ||= BsdJupiterAutomationApi::VideoPlayer.new(screen)
end

def new_menu
  @new_menu ||= BsdJupiterAutomationApi::Menus::NewMenu.new(screen)
end

def new_arrival_booking_dialog
  @new_arrival_booking_dialog ||= BsdJupiterAutomationApi::Dialogs::NewArrivalBooking.new(screen)
end

def tasks_menu
  @tasks_menu ||= BsdJupiterAutomationApi::Menus::TasksMenu.new(screen)
end

def file_menu
  @file_menu ||= BsdJupiterAutomationApi::Menus::FileMenu.new(screen)
end