class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :nm_cliente, :limit=>50, :null => false
      t.string :endereco, :limit=>150
      t.string :fone, :limit=>15
      t.string :cidade, :limit=>100
      t.string :estado, :limit=>100
      t.string :cep, :limit=>15
      t.string :cnpj, :limit=>20, :null => false
      t.string :email, :limit=>150, :null => false
      t.boolean :status

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
