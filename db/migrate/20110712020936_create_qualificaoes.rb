class CreateQualificaoes < ActiveRecord::Migration
  def self.up
    create_table :qualificaoes do |t|
      t.integer :cliente_id
      t.integer :restaurante_id
      t.float :nota
      t.float :valor_gasto
      t.timestamps
    end
    add_index(:qualificaoes, :cliente_id)
    add_index(:qualificaoes, :restaurante_id)
  end

  def self.down
    drop_table :qualificaoes
  end
end
