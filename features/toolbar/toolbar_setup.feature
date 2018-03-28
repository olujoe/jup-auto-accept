@toolbar
Feature: Jupiter - Regression Tests - Toolbar
	In order to check that I can use the Toolbar features
	As a user with suitable credentials to access the Toolbar features
	I want to use the Toolbar features

Background: Setup
	Given I ensure Jupiter is ready for testing

@toolbar_2.1 @C655191 @C655192 @C655194
Scenario: Toolbar 2.1 Current Site / 
	Then I should see "tools_site_qaw1.png , tools_site_qaws.png , tools_site_qausa.png"
	#Toolbar 4.1
	When I click on "tools_file.png"
	And I click on "tools_file_exit.png"
	Then I should not see "jupiter_top.png"

@toolbar_5_1 @toolbar1 @C655195
Scenario: Toolbar 5.1 Switch Site
	When I should see "tools_site_qaw1.png , tools_site_qaws.png , tools_site_qausa.png"
	And I click on "tools.png"
	And I click on "tools_site.png"
	And I click on "tools_site_dev.png"
	And I click on "tools_site_dev_jonathan.png"
	And I should see "tools_site_jonathan.png"
	And I click on "tools.png"
	And I click on "tools_site.png"
	And I click on "tools_site_dev.png"
	And I click on "tools_site_dev_qaw1.png"
	Then I should see "tools_site_qaw1.png"

@toolbar_5_2 @C655196
Scenario: Toolbar - Tools - Options Baseline - open
	When I click on "tools.png"
	And I click on "options.png"
	And I should see "tools_options.png"

@toolbar_5_2
Scenario Outline: Check Options
	When I doubleclick on "<closed_name>"
	And I should see "<result>"
	And I doubleclick on "<opened_name>"

Examples:
      | closed_name                     | result                        | opened_name                          |
      | tools_options_video.png         | tools_video_result.png        | tools_options_open_video.png         |
      | tools_options_location.png      | tools_location_result.png     | tools_options_open_location.png      |
      | tools_options_record.png        | tools_record_result.png       | tools_options_open_record.png        |
      | tools_options_playout.png       | tools_playout_result.png      | tools_options_open_playout.png       | 
      | tools_options_publish.png       | tools_publish_result.png      | tools_options_open_publish.png       | 
      | tools_options_currentsite.png   | tools_currentsite_result.png  | tools_options_open_currentsite.png   |
      | tools_options_homesite.png      | tools_homesite_result.png     | tools_options_open_homesite.png      |
      | tools_options_guishortcuts.png  | tools_guishortcuts_result.png | tools_options_open_guishortcuts.png  |
      | tools_options_messagealerts.png | tools_messagealert_result.png | tools_options_open_messagealert.png  |
      | tools_options_logging.png       | tools_logging_result.png      | tools_options_open_logging.png       |

#	tools_video_loadvideo.png, tools_option_false.png, tools_option_true.png
#	tools_video_portlistning.png, tools_option_false.png, tools_option_true.png
#	tools_video_videoloadtype.png, tools_option_automatic.png, tools_option_manual.png, tools_option_advanced.png
#	tools_video_qviewlite.png, tools_option_disabled.png, tools_option_enabled.png
#	tools_video_qtube.png, tools_option_disabled.png, tools_option_enabled.png

@toolbar_6 #results TBC
Scenario Outline: Toolbar - video Options 
	Given I set toolbar with <task> settings <load_Video>, <port_Listening>, <video_Load_Type>, <q_View_Lite>, <q_Tube>
	Then I should see <result1>
	When I record a new media item
	Then I should see <result2>

Examples:
	| task   | load_Video | port_Listening | video_Load_Type | q_View_Lite | q_Tube   | result1 | result2 |	
	| record | true       | true           | automatic       | enabled     | enabled  | result1 | result2 |			
	| record | false      | true           | automatic       | enabled     | enabled  | result1 | result2 |			
	| record | true       | false          | automatic       | enabled     | enabled  | result1 | result2 |			
	| record | false      | false          | automatic       | enabled     | enabled  | result1 | result2 |			
	| record | true       | true           | manual          | enabled     | enabled  | result1 | result2 |			
	| record | false      | true           | manual          | enabled     | enabled  | result1 | result2 |			
	| record | true       | false          | manual          | enabled     | enabled  | result1 | result2 |			
	| record | false      | false          | manual          | enabled     | enabled  | result1 | result2 |			
	| record | true       | true           | advanced        | enabled     | enabled  | result1 | result2 |			
	| record | false      | true           | advanced        | enabled     | enabled  | result1 | result2 |			
	| record | true       | false          | advanced        | enabled     | enabled  | result1 | result2 |			
	| record | false      | false          | advanced        | enabled     | enabled  | result1 | result2 |			
	| record | true       | true           | automatic       | disabled    | enabled  | result1 | result2 |			
	| record | false      | true           | automatic       | disabled    | enabled  | result1 | result2 |			
	| record | true       | false          | automatic       | disabled    | enabled  | result1 | result2 |			
	| record | false      | false          | automatic       | disabled    | enabled  | result1 | result2 |			
	| record | true       | true           | manual          | disabled    | enabled  | result1 | result2 |			
	| record | false      | true           | manual          | disabled    | enabled  | result1 | result2 |			
	| record | true       | false          | manual          | disabled    | enabled  | result1 | result2 |			
	| record | false      | false          | manual          | disabled    | enabled  | result1 | result2 |			
	| record | true       | true           | advanced        | disabled    | enabled  | result1 | result2 |			
	| record | false      | true           | advanced        | disabled    | enabled  | result1 | result2 |			
	| record | true       | false          | advanced        | disabled    | enabled  | result1 | result2 |			
	| record | false      | false          | advanced        | disabled    | disabled | result1 | result2 |			
	| record | true       | true           | automatic       | enabled     | disabled | result1 | result2 |			
	| record | false      | true           | automatic       | enabled     | disabled | result1 | result2 |			
	| record | true       | false          | automatic       | enabled     | disabled | result1 | result2 |			
	| record | false      | false          | automatic       | enabled     | disabled | result1 | result2 |			
	| record | true       | true           | manual          | enabled     | disabled | result1 | result2 |			
	| record | false      | true           | manual          | enabled     | disabled | result1 | result2 |			
	| record | true       | false          | manual          | enabled     | disabled | result1 | result2 |			
	| record | false      | false          | manual          | enabled     | disabled | result1 | result2 |			
	| record | true       | true           | advanced        | enabled     | disabled | result1 | result2 |			
	| record | false      | true           | advanced        | enabled     | disabled | result1 | result2 |			
	| record | true       | false          | advanced        | enabled     | disabled | result1 | result2 |			
	| record | false      | false          | advanced        | enabled     | disabled | result1 | result2 |			
	| record | true       | true           | automatic       | disabled    | disabled | result1 | result2 |			
	| record | false      | true           | automatic       | disabled    | disabled | result1 | result2 |			
	| record | true       | false          | automatic       | disabled    | disabled | result1 | result2 |			
	| record | false      | false          | automatic       | disabled    | disabled | result1 | result2 |			
	| record | true       | true           | manual          | disabled    | disabled | result1 | result2 |			
	| record | false      | true           | manual          | disabled    | disabled | result1 | result2 |			
	| record | true       | false          | manual          | disabled    | disabled | result1 | result2 |			
	| record | false      | false          | manual          | disabled    | disabled | result1 | result2 |			
	| record | true       | true           | advanced        | disabled    | disabled | result1 | result2 |			
	| record | false      | true           | advanced        | disabled    | disabled | result1 | result2 |			
	| record | true       | false          | advanced        | disabled    | disabled | result1 | result2 |			
	| record | false      | false          | advanced        | disabled    | disabled | result1 | result2 |			


Scenario Outline: Toolbar - Location Options
	Given I set toolbar with <task> settings <client>
	Then I should see <result1>
	When I record a new media item
	Then I should see <result2>

Examples:
	| task     | client      | result1 | result2 |	
	| location | autoDetect  | result1 | result2 |
	| location | local       | result1 | result2 |
	| location | remote      | result1 | result2 |

#	tools_location_client.png, tools_option_autodetect.png, tools_option_local.png, tools_option_remote.png

@toolbar_7_1 #results TBC
Scenario Outline: Toolbar 7.1 - Record Options
	Given I set toolbar with <task> settings <sidebar_only>, <sidebar_audio>, <addtoCliplist>, <addtoWIP>
	Then I should see <result1>
	When I record a new media item
	Then I should see <result2>

Examples:
	| task   | sidebar_only | sidebar_audio | addtoCliplist | addtoWIP | result1 | result2 |	
	| record | true         | true          | true          | true     | result1 | result2 |			
	| record | false        | true          | true          | true     | result1 | result2 |			
	| record | false        | false         | true          | true     | result1 | result2 |			
	| record | false        | false         | false         | true     | result1 | result2 |			
	| record | false        | false         | false         | false    | result1 | result2 |			
	| record | true         | true          | true          | false    | result1 | result2 |			
	| record | true         | true          | false         | false    | result1 | result2 |			
	| record | true         | false         | false         | false    | result1 | result2 |			
			
#	tools_record_sidebaronly.png, tools_option_false.png, tools_option_true.png
#	tools_record_sidebaraudio.png, tools_option_false.png, tools_option_true.png
#	tools_record_addtocliplist.png, tools_option_false.png, tools_option_true.png
#	tools_record_addtowip.png, tools_option_false.png, tools_option_true.png

@toolbar_8_1 #results TBC
Scenario Outline: Toolbar 8.1 - Playout Options
	Given I set toolbar with <task> settings <sidebar_only>, <loadClip>
	Then I should see <result1>
	When I record a new media item
	Then I should see <result2>

Examples:
	| task    | sidebar_only | loadClip | result1 | result2 |	
	| playout | true         | true     | result1 | result2 |
	| playout | true         | false    | result1 | result2 |
	| playout | false        | false    | result1 | result2 |
	| playout | false        | true     | result1 | result2 |
	
#	tools_playout_sidebaronly.png, tools_option_false.png, tools_option_true.png
#	tools_playout_loadclip.png, tools_option_false.png, tools_option_true.png

@toolbar_9_1 #results TBC
Scenario Outline: Toolbar 9.1 - Publish Options
	Given I set toolbar with <task> settings <loadClip>
	Then I should see <result1>
	When I record a new media item
	Then I should see <result2>

Examples:
	| task |  loadClip | result1 | result2 |	
	| task |  true     | result1 | result2 |
	| task | false     | result1 | result2 |

#	tools_publish_loadclip.png, tools_option_false.png, tools_option_true.png

@toolbar_10_1 #results TBC
Scenario Outline: Toolbar 10 - Current Site Details
	Given I view toolbar with <task> settings
	Then I should see <result1>

Examples:
	| task         | result1 |	
	| current_site | result1 |

@toolbar_11_1 #results TBC
Scenario Outline: Toolbar 11 - Home Site Details
	Given I view toolbar with <task> settings
	Then I should see <result1>

Examples:
	| task      | result1 |	
	| home_site | result1 |

@toolbar_12_1 #results TBC
Scenario Outline: Toolbar 12 - GUI Shortcuts Options
	Given I view toolbar with <task> settings
	Then I should see <result1>

Examples:
	| task          | result1 |	
	| gui_Shortcuts | result1 |

@toolbar_13_1 #results TBC
Scenario Outline: Toolbar 13 - Message Alerts 

	Given I set toolbar with <task> settings <display_Toaster>, <flash_Taskbar>
	Then I should see <result1>
	When I record a new media item
	Then I should see <result2>

Examples:
	| task           | display_Toaster | flash_Taskbar | result1 | result2 |	
	| message_Alerts | true            | true          | result1 | result2 |
	| message_Alerts | true            | false         | result1 | result2 |
	| message_Alerts | false           | false         | result1 | result2 |
	| message_Alerts | false           | true          | result1 | result2 |

#@toolbar_13_1
#Scenario: Toolbar 13.1 - Mesage Alerts Options - 
#	tools_messagealerts_displaytoaster.png, tools_option_false.png, tools_option_true.png
#	tools_messagealerts_flashtaskbar.png, tools_option_false.png, tools_option_true.png

#		tools_options_false-trueY.png, 
#		tools_options_falseY-true.png
#		tools_options_automaticY-manual-advanced.png,
#		tools_options_automatic-manualY-advanced.png,
#		tools_options_automatic-manual-advancedY.png
#		tools_options_disabledY-enabled.png
#		tools_options_disabled-enabledY.png
#		tools_options_autodetectY-local-remote.png
#		tools_options_autodetect-localY-remote.png
#		tools_options_autodetect-local-remoteY.png

#	And I doubleclick on "<opened_name>"
#	"tools_options_dropdown-button.png"

@toolbar_14_1 #results TBC
Scenario Outline: Toolbar 14 - Logging
	Given I set toolbar with <task> settings <sidebar_only>, <sidebar_audio>, <addtoCliplist>, <addtoWIP>
	Then I should see <result1>
	When I record a new media item
	Then I should see <result2>

Examples:
	| task    | errors   | warning   | information | jvm_Logging | log_file_size | result1 | result2 |	
	| logging | unticked | unticked  | unticked    | unticked    | value         | result1 | result2 |			
	| logging | ticked   | ticked    | ticked      | ticked      | value         | result1 | result2 |			


@toolbar_15_1 @toolbar_16_1 @toolbar_17_1
Scenario Outline: Toolbar - ( Clear Logs / Delete Shortcuts / Cancel) 
	Given I can view "gui_log"
	When I click on "clear_log"
	Then I should not see "gui_log"

Examples:
	| item            | button                          | result          |	
	| gui_log         | clear_log                       | gui_log         |	
	| shortcuts       | delete_shortcuts                | shortcuts       |	 
	| toolbar_options | tools_options_cancel-button.png | toolbar_options |	
