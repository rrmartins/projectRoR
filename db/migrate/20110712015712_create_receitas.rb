class CreateReceitas < ActiveRecord::Migration
  def self.up
    create_table :receitas do |t|
      t.integer :prato_id
      t.text :conteudo
      t.timestamps
    end
  end

  def self.down
    drop_table :receitas
  end
end
