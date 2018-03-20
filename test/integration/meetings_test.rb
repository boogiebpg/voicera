require 'test_helper'

class MeetingsTest < ActionDispatch::IntegrationTest
  test 'meeting index page' do
    get "/meetings"
    assert_response :success
    assert_select "td", "MyMeeting1"
    assert_select "td", "MyMeeting2"
  end

  test "successfull meeting creation" do
    get "/meetings/new"
    assert_response :success
   
    post "/meetings",
      params: { meeting: { title: 'Test Meeting', start_time: 1.hour.ago, end_time: Time.now } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "Meeting was successfully created."
    assert_select "td", "Test Meeting"
  end
end
