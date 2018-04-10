require 'test_helper'

class SearchProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_products_index_url
    assert_response :success
  end

end
