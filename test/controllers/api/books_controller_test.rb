require "test_helper"

class Api::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_books_index_url
    assert_response :success
  end
end
