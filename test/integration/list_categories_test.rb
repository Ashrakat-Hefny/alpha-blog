require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end

  test "Should show categories listing" do
    get '/categories'
    category_path(@category)
    category_path(@category2)
    assert_match @category.name, response.body
    assert_match @category2.name, response.body
  end
end
