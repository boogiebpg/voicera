require 'test_helper'

class HighlightsTest < ActionDispatch::IntegrationTest
  setup do
    @last_meeting = Meeting.last
  end

  test 'highlights index (meeting show page)' do
    @last_meeting.highlights.create(highlight_text: 'text1')
    @last_meeting.highlights.create(highlight_text: 'text2')
    get "/meetings/#{@last_meeting.id}"
    assert_response :success
    assert_select "td", "text1"
    assert_select "td", "text2"
  end

  test "successfull highlight creation" do
    get "/meetings/#{@last_meeting.id}/highlights/new"
    assert_response :success
   
    post "/meetings/#{@last_meeting.id}/highlights",
      params: { highlight: { highlight_text: 'hello', start_time: 6.minutes.ago, end_time: 5.minutes.ago } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "Highlight was successfully created."
    assert_select "td", "hello"
  end
end
