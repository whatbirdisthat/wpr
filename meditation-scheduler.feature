Background
Given a gap
And a gap has a duration
Then multiple gaps can be stored

And playback of a single audio file with gaps between the segments

Given an audio file contains segments of sound
When a gap is desired between segments of a single audio file
Then the duration of the gap is from user input

Given a sequence of gaps
And a single audio file
Then the gaps should not refer to ranges outside those of the audio file