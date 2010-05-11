require 'test_helper'

class OrdenServicosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orden_servicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orden_servico" do
    assert_difference('OrdenServico.count') do
      post :create, :orden_servico => { }
    end

    assert_redirected_to orden_servico_path(assigns(:orden_servico))
  end

  test "should show orden_servico" do
    get :show, :id => orden_servicos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => orden_servicos(:one).to_param
    assert_response :success
  end

  test "should update orden_servico" do
    put :update, :id => orden_servicos(:one).to_param, :orden_servico => { }
    assert_redirected_to orden_servico_path(assigns(:orden_servico))
  end

  test "should destroy orden_servico" do
    assert_difference('OrdenServico.count', -1) do
      delete :destroy, :id => orden_servicos(:one).to_param
    end

    assert_redirected_to orden_servicos_path
  end
end
