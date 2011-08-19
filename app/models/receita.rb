class Receita < ActiveRecord::Base
  validates_presence_of :conteudo, :message => " - deve ser preenchido"

  belongs_to :prato

  validates_presence_of :prato_id
  validates_associated :prato
end
