require 'test_helper'

class StimulreactionsControllerTest < ActionController::TestCase
  setup do
    @stimulreaction = stimulreactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stimulreactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stimulreaction" do
    assert_difference('Stimulreaction.count') do
      post :create, stimulreaction: { reaction_id: @stimulreaction.reaction_id, stimul_id: @stimulreaction.stimul_id, worksheet_id: @stimulreaction.worksheet_id }
    end

    assert_redirected_to stimulreaction_path(assigns(:stimulreaction))
  end

  test "should show stimulreaction" do
    get :show, id: @stimulreaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stimulreaction
    assert_response :success
  end

  test "should update stimulreaction" do
    patch :update, id: @stimulreaction, stimulreaction: { reaction_id: @stimulreaction.reaction_id, stimul_id: @stimulreaction.stimul_id, worksheet_id: @stimulreaction.worksheet_id }
    assert_redirected_to stimulreaction_path(assigns(:stimulreaction))
  end

  test "should destroy stimulreaction" do
    assert_difference('Stimulreaction.count', -1) do
      delete :destroy, id: @stimulreaction
    end

    assert_redirected_to stimulreactions_path
  end
end
