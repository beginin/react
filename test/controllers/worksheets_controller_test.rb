require 'test_helper'

class WorksheetsControllerTest < ActionController::TestCase
  setup do
    @worksheet = worksheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worksheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worksheet" do
    assert_difference('Worksheet.count') do
      post :create, worksheet: { age: @worksheet.age, city_id: @worksheet.city_id, dateinput: @worksheet.dateinput, language_id: @worksheet.language_id, sex: @worksheet.sex, specialty_id: @worksheet.specialty_id }
    end

    assert_redirected_to worksheet_path(assigns(:worksheet))
  end

  test "should show worksheet" do
    get :show, id: @worksheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worksheet
    assert_response :success
  end

  test "should update worksheet" do
    patch :update, id: @worksheet, worksheet: { age: @worksheet.age, city_id: @worksheet.city_id, dateinput: @worksheet.dateinput, language_id: @worksheet.language_id, sex: @worksheet.sex, specialty_id: @worksheet.specialty_id }
    assert_redirected_to worksheet_path(assigns(:worksheet))
  end

  test "should destroy worksheet" do
    assert_difference('Worksheet.count', -1) do
      delete :destroy, id: @worksheet
    end

    assert_redirected_to worksheets_path
  end
end
