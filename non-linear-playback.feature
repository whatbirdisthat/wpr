Feature: Nonlinear Playback Scheduling

  Take a set of "Gaps"

  Playback an audio stream

  Wait for "duration" (milli)seconds
  Play back a portion of the audio stream from "in-point"

  Program a "playlist" of pauses
  Playback the file(s) with the pauses inserted

  FOR each gap
    1.  WAIT for 'duration'
    2.  PLAYBACK the audio from the 'resume point'
    3.  WAIT until 'playback duration' has elapsed

  Background:
    Given the types
    When there is a playback api
    And the api can store "gap" types
    And the playback api can read a stream of audio
    And the playback api can provide chunks of audio
    And a chunk of audio has a "beginning"
    And a chunk of audio has a "duration"

  Scenario: Achieve the playing back of an audio file
    Given an audio file
    And a playback api
    When the playback api is provided with a filename
    And the filename points to a valid audio file
    Then the playback api will send the audio from the file to the speakers

  Scenario: Playback the stream inserting the gaps at their stop point
    Given a playback api
    When queried with a <gap>
    Then the playback api can provide a portion of the audio
    And the provided portion beginning matches that of <gap> "in-point"
    And the provided portion duration matches <gap> calculated duration

    Scenario: Setting a gap with duration longer than that available
      will be played out as silence.

      Given an audio file of length 100
      And a Gap with "playback duration" greater than "100"
      Then the api will play to the end of the audio
      And the time remainder will be played as silence