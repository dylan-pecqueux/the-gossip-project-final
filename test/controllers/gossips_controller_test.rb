require 'test_helper'

class GossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get gossip_id" do
    get gossips_gossip_id_url
    assert_response :success
  end

end
