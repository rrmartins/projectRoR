require '../test_helper'
class RestaurantesControllerTest < ActionController::TestCase
  fixtures :restaurantes
  def setup
    @controller = RestaurantesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
  def test_procura_restaurante
    get :busca, :nome => 'Fazano'
    assert_not_nil assigns(:restaurante)
    assert_equal restaurantes(:fazano).nome, assigns(:restaurante).nome
    assert_redirected_to :action => 'show'
  end
  def test_procura_restaurante_nao_encontra
    get :busca, :nome => 'Botequin'
    assert_redirected_to :action => 'list'
    assert_equal 'Restaurante nao encontrado.', flash[:notice]
  end
end

