require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Products"
    # assert_selector ".card-product", count: Product.count
  end

  test "lets a signed-in user create a product" do
    login_as users(:george)
    visit('/products/new')

    fill_in 'product_name', with: 'Le Wagon'
    fill_in 'product_tagline', with: 'Change your life: Learn to Code'
    # save_and_open_screenshot
    click_on 'Create Product'

    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to Code"
  end
end
