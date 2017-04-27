require 'test_helper'

class Docs::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @docs_product = docs_products(:one)
  end

  test "should get index" do
    get docs_products_url
    assert_response :success
  end

  test "should get new" do
    get new_docs_product_url
    assert_response :success
  end

  test "should create docs_product" do
    assert_difference('Docs::Product.count') do
      post docs_products_url, params: { docs_product: { characteristics: @docs_product.characteristics, code: @docs_product.code, expiration_date: @docs_product.expiration_date, name: @docs_product.name, price: @docs_product.price, status: @docs_product.status } }
    end

    assert_redirected_to docs_product_url(Docs::Product.last)
  end

  test "should show docs_product" do
    get docs_product_url(@docs_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_docs_product_url(@docs_product)
    assert_response :success
  end

  test "should update docs_product" do
    patch docs_product_url(@docs_product), params: { docs_product: { characteristics: @docs_product.characteristics, code: @docs_product.code, expiration_date: @docs_product.expiration_date, name: @docs_product.name, price: @docs_product.price, status: @docs_product.status } }
    assert_redirected_to docs_product_url(@docs_product)
  end

  test "should destroy docs_product" do
    assert_difference('Docs::Product.count', -1) do
      delete docs_product_url(@docs_product)
    end

    assert_redirected_to docs_products_url
  end
end
