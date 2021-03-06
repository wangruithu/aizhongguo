require 'test_helper'

class ResidentsControllerTest < ActionController::TestCase
  setup do
    @resident = residents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:residents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resident" do
    assert_difference('Resident.count') do
      post :create, resident: { birthday: @resident.birthday, condition: @resident.condition, contact: @resident.contact, contact_phone_number: @resident.contact_phone_number, gender: @resident.gender, name: @resident.name, phone_number: @resident.phone_number, room_id: @resident.room_id }
    end

    assert_redirected_to resident_path(assigns(:resident))
  end

  test "should show resident" do
    get :show, id: @resident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resident
    assert_response :success
  end

  test "should update resident" do
    patch :update, id: @resident, resident: { birthday: @resident.birthday, condition: @resident.condition, contact: @resident.contact, contact_phone_number: @resident.contact_phone_number, gender: @resident.gender, name: @resident.name, phone_number: @resident.phone_number, room_id: @resident.room_id }
    assert_redirected_to resident_path(assigns(:resident))
  end

  test "should destroy resident" do
    assert_difference('Resident.count', -1) do
      delete :destroy, id: @resident
    end

    assert_redirected_to residents_path
  end
end
