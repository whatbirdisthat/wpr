Feature: Insert Gaps

  Pause playback of a given audio file, for a given amount of time
  Program a "playlist" of pauses
  Playback the file with the pauses inserted

  Background:
    Given the tyoes
    When  there is a gap
    And a gap has a duration
    And a gap has a stop point
    And a gap has a resume point
    And a gap has a unique sequence index
    And multiple gaps can be stored


  Scenario: User arranges a sequence of user defined gaps
  during playback of a given audio file

    Given an audio file contains segments of sound
    When a gap is desired between segments of a single audio file
    Then the duration of the gap is from user input

    Given a sequence of gaps
    And a single audio file
    Then the gaps should not refer to ranges outside those of the audio file
