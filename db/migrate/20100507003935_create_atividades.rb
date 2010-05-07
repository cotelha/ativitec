class CreateAtividades < ActiveRecord::Migration
  def self.up
    create_table :atividades do |t|
      t.string :nm_atividade, :size=>50
      t.string :tp_atividade
      t.boolean :exibe_projeto
      t.string :icone_atividade, :size=>50
      t.integer :nr_ordem
      t.boolean :exibe_prev_termino

      t.timestamps
    end
  end

  def self.down
    drop_table :atividades
  end
end
