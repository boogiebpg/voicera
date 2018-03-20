require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  test "creating new meeting" do
    meeting = Meeting.new(title: 'New Meeting')
    assert meeting.save
  end

  test "meeting fields" do
    meeting = Meeting.first
    assert_respond_to meeting, :title
    assert_respond_to meeting, :start_time
    assert_respond_to meeting, :end_time
    assert_respond_to meeting, :organizer_email
    assert_respond_to meeting, :audio_file_location
  end
end
