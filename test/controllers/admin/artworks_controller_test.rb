require "test_helper"

class Admin::ArtworksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_artworks_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_artworks_show_url
    assert_response :success
  end
end
