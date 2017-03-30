require 'test_helper'

class CleanersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cleaner = cleaners(:one)
  end

  test "should get index" do
    get cleaners_url
    assert_response :success
  end

  test "should get new" do
    get new_cleaner_url
    assert_response :success
  end

  test "should create cleaner" do
    assert_difference('Cleaner.count') do
      post cleaners_url, params: { cleaner: { email: @cleaner.email, first_name: @cleaner.first_name, last_name: @cleaner.last_name, quality_score: @cleaner.quality_score } }
    end

    assert_redirected_to cleaner_url(Cleaner.last)
  end

  test "should show cleaner" do
    get cleaner_url(@cleaner)
    assert_response :success
  end

  test "should get edit" do
    get edit_cleaner_url(@cleaner)
    assert_response :success
  end

  test "should update cleaner" do
    patch cleaner_url(@cleaner), params: { cleaner: { email: @cleaner.email, first_name: @cleaner.first_name, last_name: @cleaner.last_name, quality_score: @cleaner.quality_score } }
    assert_redirected_to cleaner_url(@cleaner)
  end

  test "should destroy cleaner" do
    assert_difference('Cleaner.count', -1) do
      delete cleaner_url(@cleaner)
    end

    assert_redirected_to cleaners_url
  end
end
