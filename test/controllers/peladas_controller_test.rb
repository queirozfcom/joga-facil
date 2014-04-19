require 'test_helper'

class PeladasControllerTest < ActionController::TestCase
  setup do
    @pelada = peladas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:peladas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pelada" do
    assert_difference('Pelada.count') do
      post :create, pelada: { custo: @pelada.custo, data: @pelada.data, local: @pelada.local, minimo_pessoas: @pelada.minimo_pessoas, responsavel: @pelada.responsavel }
    end

    assert_redirected_to pelada_path(assigns(:pelada))
  end

  test "should show pelada" do
    get :show, id: @pelada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pelada
    assert_response :success
  end

  test "should update pelada" do
    patch :update, id: @pelada, pelada: { custo: @pelada.custo, data: @pelada.data, local: @pelada.local, minimo_pessoas: @pelada.minimo_pessoas, responsavel: @pelada.responsavel }
    assert_redirected_to pelada_path(assigns(:pelada))
  end

  test "should destroy pelada" do
    assert_difference('Pelada.count', -1) do
      delete :destroy, id: @pelada
    end

    assert_redirected_to peladas_path
  end
end
