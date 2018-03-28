@publish, @publish-chunks
Feature: Publish from Chunked arrival booking

  Background:

  Given A chunked arrival booking created in Jupiter for 3 chunks
    And The media item chunks are available in media search pane

  Scenario : Publish from Chunked media items
    When I set first chunk as the IN point
    And  I set another chunk as the OUT point
    And  I Publish selection
    Then New media Item is created from selection
    And  Metadata for new published item is as entered
    And  Playback for new published item contains frames for selected chunks only
