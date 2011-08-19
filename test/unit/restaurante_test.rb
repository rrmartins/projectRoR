require '../test_helper'

class RestauranteTest < ActiveSupport::TestCase
	fixtures :restaurantes
	def test_restaurante
		restaurante_fazano = Restaurante.new :nome => restaurantes(:fazano).nome,
			:endereco => restaurantes(:fazano).endereco
		assert restaurante_fazano.save
		restaurante_fazano_copia = Restaurante.find(restaurante_fazano.id)
		assert_equal restaurante_fazano.nome, restaurante_fazano_copia.nome
		restaurante_fazano.nome = "Fazano"
		assert restaurante_fazano.save
		assert restaurante_fazano.destroy
	end
end

