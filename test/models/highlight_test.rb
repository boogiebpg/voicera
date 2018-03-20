require 'test_helper'

class HighlightTest < ActiveSupport::TestCase
  setup do
    meeting = Meeting.create(title: 'New Meeting')
    @highlight = meeting.highlights.new(highlight_text: 'test')
  end

  test "saving new highlight" do
    assert @highlight.save
  end

  test "highlight fields" do
    assert_respond_to @highlight, :highlight_text
    assert_respond_to @highlight, :start_time
    assert_respond_to @highlight, :end_time
  end
end
