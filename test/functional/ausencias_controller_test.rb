require 'test_helper'

class AusenciasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ausencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ausencia" do
    assert_difference('Ausencia.count') do
      post :create, :ausencia => { }
    end

    assert_redirected_to ausencia_path(assigns(:ausencia))
  end

  test "should show ausencia" do
    get :show, :id => ausencias(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ausencias(:one).id
    assert_response :success
  end

  test "should update ausencia" do
    put :update, :id => ausencias(:one).id, :ausencia => { }
    assert_redirected_to ausencia_path(assigns(:ausencia))
  end

  test "should destroy ausencia" do
    assert_difference('Ausencia.count', -1) do
      delete :destroy, :id => ausencias(:one).id
    end

    assert_redirected_to ausencias_path
  end
end
