Feature: Nonlinear Playback Scheduling

  Take a set of "Gaps"
  Control the playback of an audio stream
  Play back a portion of the audio stream from "in-point" until "duration"

  Program a "playlist" of pauses
  Playback the file with the pauses inserted

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

