Feature: Nonlinear Playback Scheduling

  Take a set of stop-resume points (called Gaps by us)
  Control the playback of an audio stream

  Background:
    Given the types
    When there is a playback api
    And the api can store "gap" types
    And the playback api can read a stream of audio
    And the playback api can provide chunks of audio
    And a chunk of audio has a "beginning"
    And a chunk of audio has a "duration"


  Scenario: Playback the stream inserting the gaps at their stop point
    Given a playback api
    When queried with a <gap>
    Then the playback api can provide a portion of the audio
    And the provided portion beginning matches that of <gap> "in-point"
    And the provided portion duration matches <gap> duration
