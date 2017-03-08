Feature: Gaps

  Cause silence for a given amount of time
  Resume playback at a specified point

  Gaps must be arrangeable (sortable?).

  Let: the length of the test audio file be hard-coded to 100.

  Background:
    Given an audio file of length "100"
    And there are "types"
    When  there is a "gap" type "object"
    And a "gap" has "filenane" type "string"
    And a "gap" has "duration" type "int"
    And a "gap" has "resume point" type "int"
    And a "gap" has a "playback duration" type "int"
    And a "gap" has "sequence index" type "int"
    Then multiple gaps can be stored in a sortable array

  Scenario: A sortable array of Gap object containing multiple occurrences
  of the same "sequence index"

    Given a sortable set of "10" "Gap" objects
    And "5" of the sortable set have the same "sequence index"
    When the set is sorted
    Then gaps with matching "sequence id" are sorted according to "filenane" then "resume point"

  Scenario: A Gap with undefined resume point will coerce to 0

    Given a gap
    When the gap does not define a "resume point"
    Then "resume point" has the value of "0"


  Scenario Outline: Validate gaps contract
    Given a set of gaps
    And target audio with a duration of "100"
    And <resume_point> is less than "100"
    And <resume_point> is greater than 0
    Then the <is valid> should be "true"

    Examples:
      | duration | resume point | index | is valid | why            |
      | 10       | 91           | 1     | true     | duration < 100 |
      | 101      | 1            | 2     | false    | duration > 100 |
      | 101      | 1            | 2     | false    | duration > 100 |
