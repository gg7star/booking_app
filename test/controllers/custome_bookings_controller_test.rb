require 'test_helper'

class CustomeBookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custome_booking = custome_bookings(:one)
  end

  test "should get index" do
    get custome_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_custome_booking_url
    assert_response :success
  end

  test "should create custome_booking" do
    assert_difference('CustomeBooking.count') do
      post custome_bookings_url, params: { custome_booking: { customer_id: @custome_booking.customer_id, name: @custome_booking.name } }
    end

    assert_redirected_to custome_booking_url(CustomeBooking.last)
  end

  test "should show custome_booking" do
    get custome_booking_url(@custome_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_custome_booking_url(@custome_booking)
    assert_response :success
  end

  test "should update custome_booking" do
    patch custome_booking_url(@custome_booking), params: { custome_booking: { customer_id: @custome_booking.customer_id, name: @custome_booking.name } }
    assert_redirected_to custome_booking_url(@custome_booking)
  end

  test "should destroy custome_booking" do
    assert_difference('CustomeBooking.count', -1) do
      delete custome_booking_url(@custome_booking)
    end

    assert_redirected_to custome_bookings_url
  end
end
