Feature: Gaps

  Cause silence for a given amount of time
  Resume playback at a specified point

  Gaps must be arrangeable (sortable?).

  Let: the length of the single audio file be hard-coded to 100.

  Background:
    Given an audio file of length "100"
    And there are "types"
    When  there is a "gap" type "object"
    And a gap has a "duration" type "int"
    And a gap has a "resume point" type "int"
    And a gap has a "unique sequence index" type "int"
    Then multiple gaps can be stored in a sortable array


  Scenario: User arranges a sequence of user defined gaps
  during playback of a given audio file

  Scenario Outline: A bunch of gaps are checked for validity
    Given a set of gaps
    And a single audio file
    And <resume_point> is less than "100"
    And <resume_point> is greater than 0
    Then the <is valid> should be valid

    Examples:
      | duration | resume point | index | is valid | why            |
      | 10       | 91           | 1     | true     | duration < 100 |
      | 101      | 1            | 2     | false    | duration > 100 |
      | 101      | 1            | 2     | false    | duration > 100 |


    Given a gap
    When the gap does not define a "resume point"
    Then "resume point" has the value of "0"

    Given an audio file contains segments of sound
    When a gap is desired between segments of a single audio file
    Then the calculated duration of the gap is from user input

