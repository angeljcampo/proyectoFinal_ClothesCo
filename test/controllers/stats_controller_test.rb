require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get my_stats" do
    get stats_my_stats_url
    assert_response :success
  end

end
