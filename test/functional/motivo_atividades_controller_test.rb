require 'test_helper'

class MotivoAtividadesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivo_atividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivo_atividade" do
    assert_difference('MotivoAtividade.count') do
      post :create, :motivo_atividade => { }
    end

    assert_redirected_to motivo_atividade_path(assigns(:motivo_atividade))
  end

  test "should show motivo_atividade" do
    get :show, :id => motivo_atividades(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => motivo_atividades(:one).to_param
    assert_response :success
  end

  test "should update motivo_atividade" do
    put :update, :id => motivo_atividades(:one).to_param, :motivo_atividade => { }
    assert_redirected_to motivo_atividade_path(assigns(:motivo_atividade))
  end

  test "should destroy motivo_atividade" do
    assert_difference('MotivoAtividade.count', -1) do
      delete :destroy, :id => motivo_atividades(:one).to_param
    end

    assert_redirected_to motivo_atividades_path
  end
end
