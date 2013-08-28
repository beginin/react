require 'test_helper'

class StimulsControllerTest < ActionController::TestCase
  setup do
    @stimul = stimuls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stimuls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stimul" do
    assert_difference('Stimul.count') do
      post :create, stimul: { stimul: @stimul.stimul }
    end

    assert_redirected_to stimul_path(assigns(:stimul))
  end

  test "should show stimul" do
    get :show, id: @stimul
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stimul
    assert_response :success
  end

  test "should update stimul" do
    patch :update, id: @stimul, stimul: { stimul: @stimul.stimul }
    assert_redirected_to stimul_path(assigns(:stimul))
  end

  test "should destroy stimul" do
    assert_difference('Stimul.count', -1) do
      delete :destroy, id: @stimul
    end

    assert_redirected_to stimuls_path
  end
end
